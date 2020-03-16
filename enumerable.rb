module Enumerable
  def my_each
    return to_enum unless block_given?

    counter = 0
    while counter < length
      yield self[counter]
      counter += 1
    end
    self
  end

  def my_each_with_index
    return to_enum unless block_given?

    counter = 0
    while counter < length
      yield(self[counter], counter)
      counter += 1
    end
    self
  end

  def my_select
    return to_enum unless block_given?

    counter = 0
    num = []
    while counter < length
      num << self[counter] if yield(self[counter])
      counter += 1
    end
    num
  end

  def my_all?
    all = true
    my_each do |item|
      all = yield(item)
      break unless all
    end
    all
  end

  def my_any?
    any = false
    my_each do |item|
      any = yield(item)
      break if any
    end
    any
  end

  def my_none?
    any = false
    my_each do |item|
      any = yield(item)
      break if any
    end
    !any
  end

  def my_count
    counter = 0
    my_each do |item|
      counter += 1 if yield(item)
    end
    counter
  end

  def my_map(&proc)
    counter = 0
    array2 = []
    while counter < size
      array2 << if block_given?
                  yield(self[counter])
                else
                  proc.call(self[counter])
                end
      counter += 1
    end
    array2
  end

  def my_inject(*args)
    init = !args.empty?
    memo = init ? args[0] : self[0]
    drop(init ? 0 : 1).my_each do |item|
      memo = yield(memo, item)
    end
    memo
  end

  # def my_inject(list = nil)
  #   if list.nil?
  #     self[0]
  #     idx = 1
  #   else
  #     idx = 0
  #   end
  #   self
  # end
end

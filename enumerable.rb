# rubocop:disable Metrics/ModuleLength
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

  def my_all?(param = nil)
    return test_param_all(param) unless param.nil?

    all_true = true
    if block_given?
      my_each { |x| all_true = false unless yield(x) }
    else
      my_each { |x| all_true = false if x.nil? || x == false }
    end
    all_true
  end

  def my_any?(param = nil)
    return test_param_any(param) unless param.nil?

    any_true = false
    if block_given?
      my_each { |x| any_true = true if yield(x) }
    else
      my_each { |x| any_true = true if !x.nil? && x != false }
    end
    any_true
  end

  def my_none?(param = nil)
    return test_param_none(param) unless param.nil?

    all_false = true
    if block_given?
      my_each { |x| all_false = false if yield(x) }
    else
      my_each { |x| all_false = false unless x.nil? || x == false }
    end
    all_false
  end

  def my_count(index = nil)
    counter = 0

    if index
      my_each { |x| counter += 1 if x == index }
      counter
    elsif block_given?
      my_each { |x| counter += 1 if yield(x) }
      counter
    else
      length
    end
  end

  def my_map(&proc)
    return to_enum(:my_map) unless block_given?

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

  def inject_arg_valid?(*arg)
    acc = arg[0]&.is_a?(Numeric) ? arg[0] : to_a[0]
    if arg[0]&.is_a? Symbol
      operation = arg[0]
    elsif arg[1]&.is_a? Symbol
      operation = arg[1]
    end
    [acc, operation]
  end

  def eval_operation?(operation)
    ':/ :% :-'.include?(operation.to_s)
  end

  def inject_valid_symbol?
    lambda do |arg, i|
      res = (arg.size == 1 && !i.zero?)
      res ||= arg.size == 2
      res
    end
  end

  def next_index?(arg, index)
    ret = arg.size == 2 || arg.size.zero?
    ret &&= index.zero?
    ret
  end

  def check_operation(operation, acc, elem)
    eval_operation?(operation) ? [acc, elem] : [elem, acc]
  end

  def my_inject(*arg)
    acc, operation = inject_arg_valid?(*arg)
    each_with_index do |e, i|
      if block_given? && arg.size < 2
        next if next_index?(arg, i)

        acc = yield(acc, e) if acc
      elsif inject_valid_symbol?.call(arg, i)
        e, acc = check_operation(operation, acc, e)
        acc = e.send(operation, acc)
      end
      next
    end
    acc
  end
end

# rubocop:enable Metrics/ModuleLength

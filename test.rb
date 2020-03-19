# require_relative "enumerable.rb"
# num = %w[20 40 30 10 61 70 7 9 3 2]
# p [20, 40, 30, 10, 61, 70, 7, 9, 3, 2].my_each { |item| puts item }
# num.my_each_with_index { |item, value| puts "#{item} with index #{value}" }
# p [20, 40, 30, 10, 61, 70, 7, 9, 3, 2].my_select(&:odd?)
# p [1].all?(Integer)
# p [1].my_all?(Integer)
# p %w[a b].all?(/\w/)
# p %w[a b].my_all?(/\w/)
# p [1].all?(1)
# p [1].my_all?(1)
# p %w[ant bear cat].all? { |word| word.length >= 3 }
# p %w[ant bear cat].all? { |word| word.length >= 4 }
# p %w[ant bear cat].all?(/t/)
# p [1, 2i, 3.14].all?(Numeric)
# p [nil, true, 99].all?
# p [].all?
# p [1].any?(Integer)
# p %w[a b].any?(/\w/)
# p %w[a b].my_any?(/\w/)
# p %w[ant bear cat].any? { |word| word.length >= 3 }
# p %w[ant bear cat].any? { |word| word.length >= 4 }
# p %w[ant bear cat].any?(/d/)
# p [nil, true, 99].any?(Integer)
# p [nil, true, 99].any?
# p [].any?
# p %w{ant bear cat}.none? { |word| word.length == 5 }
# p %w{ant bear cat}.none? { |word| word.length >= 4 }
# p %w{ant bear cat}.none?(/d/)
# p [1, 3.14, 42].none?(Float)
# p [].none?
# p [nil].none?
# p [nil, false].none?
# p [nil, false, true].none?
# p num.my_count { |item| item.length.even? }
# p [1, 2, 3].count
# p [1, 2, 3].count(2)
# p my_proc = Proc.new { |num| num > 5 }
# p [4, 6].my_map(my_proc)
# p [4, 6].my_map(my_proc) { |num| num < 5 }
# p num.my_map { |item| item.to_i + 5 }
# p [1].map
# p [1].my_map
# p [20, 40, 30, 10, 61, 70, 7, 9, 3, 2].my_inject(&:+)
# p [1, 2, 3].inject(:+)
# p [1, 2, 3].my_inject(:+)
# p [20, 40, 30, 10, 61, 70, 7, 9, 3, 2].my_inject(&:*)
# p [1, 2, 3].inject(2, :+)
# p [1, 2, 3].my_inject(2, :+)
# p [20, 40, 30, 10, 61, 70, 7, 9, 3, 2].my_map(&:odd?)

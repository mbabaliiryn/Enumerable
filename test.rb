# require_relative "enumerable.rb"
# num = %w[20 40 30 10 61 70 7 9 3 2]
# p [20, 40, 30, 10, 61, 70, 7, 9, 3, 2].my_each { |item| puts item }
# num.my_each_with_index { |item, value| puts "#{item} with index #{value}" }
# p [20, 40, 30, 10, 61, 70, 7, 9, 3, 2].my_select(&:odd?)
# p num.my_all? { |x| x.length == 3 }
# [1].all?
# [1].my_all?
# %w[a].all?(/\w/)
# [1].all?(1)
# [1].any?
# [1].my_any?
# [1].any?(Integer)
# %w[a].any?(/\w/)
# %w[a].my_any?(/\w/)
# [1].any?(1)
# [1].my_any?(1)
# [1].my_any?(Integer)
# p "",num.my_none? { |num| num.length == 10 }
# p [false].my_none?
# [1].none?(String)
# [1].my_none?(String)
# [1].none?(/\w/)
# [1].my_none?(/\w/)
# [1].none?(2)
# [1].my_none?(2)
# p num.my_count { |item| item.length.even? }
# p [1, 2, 3].count
# p [1, 2, 3].count(2)
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

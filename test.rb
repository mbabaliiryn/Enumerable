# require_relative "enumerable.rb"
# num = %w[20 40 30 10 61 70 7 9 3 2]
# p [20, 40, 30, 10, 61, 70, 7, 9, 3, 2].my_each { |item| puts item }
# num.my_each_with_index { |item, value| puts "#{item} with index #{value}" }
# p [20, 40, 30, 10, 61, 70, 7, 9, 3, 2].my_select(&:odd?)
# p num.my_all? { |x| x.length == 3 }
# p num.my_any?(&:empty?)
# p num.my_none? { |num| num.length == 10 }
# p num.my_count { |item| item.length.even? }
# p num.my_map { |item| item.to_i + 5 }
# p [20, 40, 30, 10, 61, 70, 7, 9, 3, 2].my_inject(&:+)
# p [20, 40, 30, 10, 61, 70, 7, 9, 3, 2].my_inject(&:*)
# p [20, 40, 30, 10, 61, 70, 7, 9, 3, 2].my_map(&:odd?)

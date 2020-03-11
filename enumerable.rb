def my_each(num)
  count = 0
  while count < num.size
    yield num[count]

    count += 1
  end
  num
end

def my_each_with_index
  letter.my_each_with_index do |item, index|
    puts "#{item} is a member #{index}"
  end
end


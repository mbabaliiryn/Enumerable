def my_each(num)
  count = 0
  while count < num.size
    yield num[count]

    count += 1
  end
  num
end

# 1) Дан массив имен [‘svetlana’, ‘pavel’, ‘ natalya’ ]
# надо получить массив где все имена с заглавной буквы
# 2) Дан массив чисел в виде строк [‘1’, ‘2’, ‘3’, ‘4’, ‘5’]
# надо вернуть массив где элементы будут остатком от деления на 2
# и содержать строку “ остаток от N = n”. Пример: [“Остаток от числа 1 = 1”, “Остаток от числа 2 = 0”]
# 3) Массив ['  foo', 'bar  ', 'fooo ', ' bar ', ' dddd ', 'foo'] - о
# чистить элементы от пробелов в начале и в конце, в массиве значения
# должны быть уникальными, без повторений, отсортировать их по алфавиту.
# 4) Массив [“one”, “two”, “three”, “four”, “five”, “six” ] -
# вернуть массив только  с теми значениями у которых нечетное количество символов в строке

# task 1
names = %w[svetlana pavel natalya]
names = names.map(&:capitalize)

puts names

# task 2
numbers = %w[1 2 3 4 5]

numbers.map! do |num|
  modulo = num.to_i % 2
  # помню, что надо быть осторожнее с "map!" вместо "map". Поставила так, чтобы было легче проверять
  "Остаток от числа #{num} = #{modulo}"
end

puts numbers

# task 3
foo = ['  foo', 'bar  ', 'fooo ', ' bar ', ' dddd ', 'foo']
foo.map!(&:strip)
foo.uniq!.sort!

puts foo

# task 4
numbers_2 = %w[one two three four five six]

numbers_2 = numbers_2.select { |num| num.length.odd? }.join(', ')

puts numbers_2

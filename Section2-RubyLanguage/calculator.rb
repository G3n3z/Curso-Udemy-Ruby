
25.times do
  puts "-"
end
puts "Enter first number"
first_number = gets.chomp.to_i
puts "Enter second number"
second_number = gets.chomp.to_i

puts "Enter operator"
operator = gets.chomp


case operator
when "+"
  result = first_number + second_number
when "-"
  result = first_number - second_number
else
  result = "Invalid operator"
end

puts("Result = #{result}")
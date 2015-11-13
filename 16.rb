=begin

2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?

=end

x = 2 ** 1000
total = 0
x.to_s.each_char {|number| total += number.to_i}
puts total.to_s
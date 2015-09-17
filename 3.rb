=begin

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?

=end

require 'prime.rb'

num = 600851475143

list = Prime.first 10000

max = 0

list.each do |x|
	if num % x == 0
		max = x
	end
end

puts max
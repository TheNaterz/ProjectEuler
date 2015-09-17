=begin

2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

=end

num = (1..20).inject(1) { |result, n| result.lcm n}

puts num

# Cheated. Completed by hand using products of prime numbers to create numbers 1-20. Simple, really. Code above was found in a forum. Ruby is WAY too powerful.
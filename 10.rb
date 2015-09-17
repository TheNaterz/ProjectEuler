=begin

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.

=end

require 'prime.rb'

two_million = 2000000
sum = 0
Prime.each(two_million) do |num|
  sum += num
end

puts sum
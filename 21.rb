=begin 

Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.

=end

require "prime"
 
class Integer
  def proper_divisors
    return [] if self == 1
    primes = prime_division.flat_map{|prime, freq| [prime] * freq}
    (1...primes.size).each_with_object([1]) do |n, res|
      primes.combination(n).map{|combi| res << combi.inject(:*)}
    end.flatten.uniq
  end
end

amicable_nums = []

current = 1

while current < 10001
  if current.proper_divisors.length > 0
    number = 0
    current.proper_divisors.each {|x| number += x}
    if number > 0 && number.proper_divisors.length > 0 && number != current
      check = 0
      number.proper_divisors.each {|x| check += x}
      if check == current
        amicable_nums << current
        amicable_nums << check
      end
    end
  end
  current += 1
end

amicable_nums.uniq!

total = 0
amicable_nums.each {|x| total += x}
puts total

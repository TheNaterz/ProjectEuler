=begin 

Euler discovered the remarkable quadratic formula:

n² + n + 41

It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 41.

The incredible formula  n² − 79n + 1601 was discovered, which produces 80 primes for the consecutive values n = 0 to 79. The product of the coefficients, −79 and 1601, is −126479.

Considering quadratics of the form:

n² + an + b, where |a| < 1000 and |b| < 1000

where |n| is the modulus/absolute value of n
e.g. |11| = 11 and |−4| = 4
Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0.

=end

require 'prime'

all_a = []
all_b = []
max_a = 0
max_b = 0
max_length = 0

(2...1000).each do |num|
  if Prime.prime?(num)
    all_b << num
  end
end

(0..999).each do |num|
  num = num - 500
  all_a << ((2*num)+1)
end

max_a = 0
max_b = 0
max_length = 0

all_b.each do |b|
  all_a.each do |a|
    n = 0
    while Prime.prime?((n*n)+(a*n)+b)
      n += 1
    end
    if n > max_length
      max_length = n
      max_a, max_b = a, b
    end
  end
end

prod = max_a*max_b
puts "#{max_a} #{max_b} #{max_length} #{prod}"
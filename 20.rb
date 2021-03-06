=begin 

n! means n × (n − 1) × ... × 3 × 2 × 1

For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!

=end

class Integer
  def fact
    (1..self).reduce(:*) || 1
  end
end

total = 0

number = 100.fact
number.to_s.each_char {|num| total += num.to_i}
puts total 
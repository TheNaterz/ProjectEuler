=begin 

A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

=end
 
class Integer
  def divisors_sum
    n = self

    return 0 if n == 1
     
    sum = 1 
    sqrt = Math.sqrt(n)
              
    (2..sqrt).each do |i|
      if n % i == 0       
        sum += n / i if i != sqrt
        sum += i
      end
    end
     
    sum  
  end
 
  def abundant?
    self < divisors_sum
  end
end
 
max = 28123
 
an = (1..max).select { |n| n.abundant? }
 
ans = []
an.each do |x|
  an.each do |y|
    s = x+y
    break if s > max
    ans << s
  end
end

not_ans = (1..max).to_a - ans
puts not_ans.inject(0) { |agg, n| agg + n }
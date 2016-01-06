=begin 

Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

1634 = 1^4 + 6^4 + 3^4 + 4^4
8208 = 8^4 + 2^4 + 0^4 + 8^4
9474 = 9^4 + 4^4 + 7^4 + 4^4
As 1 = 1^4 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

=end

all_nums = []

(0..9).each do |x1|
  (x1..9).each do |x2|
    (x2..9).each do |x3|
      (x3..9).each do |x4|
        (x4..9).each do |x5|
          (x5..9).each do |x6|
            num = (x1 ** 5) + (x2 ** 5) + (x3 ** 5) + (x4 ** 5) + (x5 ** 5) + (x6 ** 5)
            num_a = num.to_s.split('')
            num2 = num_a.inject(0) {|sum, n| sum + (n.to_i ** 5)}
            num2_a = num2.to_s.split('')
            if num == num2 && num2_a.length > 1
              all_nums << num
            end
          end
        end
      end
    end
  end
end

puts all_nums.inject(:+)
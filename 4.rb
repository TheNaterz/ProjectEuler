=begin

A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.

=end

max_palindrome = 0

for i in 111..999
	for j in 111..999
		x = i * j
		forwards = x.to_s
		backwards = forwards.reverse
		if forwards == backwards
			if x > max_palindrome
				max_palindrome = x
			end
		end
	end
end

puts max_palindrome
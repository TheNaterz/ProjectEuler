=begin

A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

a2 + b2 = c2
For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.

=end

a = 1
flag = false

for i in a...500
	b = i+1
	for j in b...500
		c = Math.sqrt((i**2) + (j**2))
		if c % 1 == 0
			puts "a: #{i} b: #{j} c: #{c}"
			puts i+j+c
		end
		if (i+j+c) == 1000.0
			c = c.to_i
			a = i
			b = j
			flag = true
			break
		end
		if flag
			break
		end
	end
	if flag
		break
	end
end
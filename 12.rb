=begin

The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

Let us list the factors of the first seven triangle numbers:

 1: 1
 3: 1,3
 6: 1,2,3,6
10: 1,2,5,10
15: 1,3,5,15
21: 1,3,7,21
28: 1,2,4,7,14,28
We can see that 28 is the first triangle number to have over five divisors.

What is the value of the first triangle number to have over five hundred divisors?

=end

def num_divisors(n)
  if n % 2 == 0
    n = n/2
  end
  divisors = 1
  count = 0
  while n % 2 == 0 do
    count += 1
    n = n/2
  end
  divisors = divisors * (count + 1)
  p = 3
  while n != 1 do
    count = 0
    while n % p == 0 do
      count += 1
      n = n/p
    end
    divisors = divisors * (count + 1)
    p += 2
  end
  return divisors
end

def find_triangular_index(factor_limit)
  n = 1
  lnum, rnum = num_divisors(n), num_divisors(n+1)
  while lnum * rnum < 500 do
    n += 1
    lnum, rnum = rnum, num_divisors(n+1)
  end
  return n
end

index = find_triangular_index(500)
triangle = (index * (index + 1)) / 2
puts triangle

# Wasn't really sure how to tackle this one. After some research, it turns out that
# an efficient solution requires knowledge of combinatorics. That stuff goes way
# over my head, so I decided to cheat on this one. Code was adpated from:
# => code.jasonbhill.com/sage/project-euler-problem-12/
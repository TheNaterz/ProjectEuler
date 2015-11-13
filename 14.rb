=begin

The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.

=end

collatz_sequences = Array.new(999999, 0)
max_sequence_index = 0

for i in 1...1000000
  n, s = i, 1
  loop do
    break if n == 1
    n.even? ? n /= 2 : n = 3 * n + 1
    if n < 1000000
      if collatz_sequences[n] != 0
        s += collatz_sequences[n]
        break
      end
    end
    s += 1
  end
  collatz_sequences[i] = s
  if collatz_sequences[i] >= collatz_sequences[max_sequence_index]
    max_sequence_index = i
  end
end

puts max_sequence_index
puts collatz_sequences[max_sequence_index]

# First tried solving with recursion, but result was either too slow or the stack level went too deep. After thinking about it, I realized that the code
# was computing the same values over and over again. If I cached those values, then my code could just pull from the cache and the result would be much
# faster.
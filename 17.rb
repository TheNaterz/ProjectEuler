=begin

If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
  
=end

file = File.open("numberwords.txt", "r+")
contents = file.read
dict = eval(contents.gsub!(":", " =>"))

x = 1
total = 0
while x < 1001
  word = dict[x.to_s]
  word.gsub!(" ", "")
  word.gsub!("-", "")
  word.each_char {|c| total += 1}
  x += 1
end

puts total
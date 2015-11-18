=begin 

Using names22.txt, a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

What is the total of all the name scores in the file?

=end

def alphabetical_score(name)
  score = 0
  name.each_char do |c|
    score += c.ord - 64
  end
  return score
end

name_file = File.open("names22.txt", "r+")
name_array = name_file.read.split(",").sort

puts name_array[937]

total_score = 0
name_array.each_index do |i|
  name = name_array[i].tr('"', '').strip
  puts name
  score = alphabetical_score(name)
  temp = score*(i+1)
  total_score += temp
end

puts total_score
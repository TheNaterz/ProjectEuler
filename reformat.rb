file = File.open("numberwords.txt", "r+")
contents = file.read
contents.gsub!(":", " =>")
puts contents
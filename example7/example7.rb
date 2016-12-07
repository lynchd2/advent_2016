def abba1?(sequence)
	count = 0
 	sequence.scan(/\[(\w+)\]/).each do |line|
 		line = line[0]
 		p line
 		line.split("").each_with_index do |letter, i|
 			if line[i + 3] && (letter + line[i + 1]) == (line[i + 3] + line[i + 2])
 				return false
 			end
 		end
 	end
 	sequence.scan(/(\w+)\[/).each do |line|
 		line = line[0]
 		p line
 		line.split("").each_with_index do |letter, i|
 			if line[i + 3] && (letter + line[i + 1]) == (line[i + 3] + line[i + 2]) && (letter != line[i + 2])
 				p (letter + line[i + 1]) + (line[i + 2] + line[i + 3])
 				count += 1
 			end
 		end
 	end
 sequence.scan(/\](\w+)/).each do |line|
 		line = line[0]
 		p line
 		line.split("").each_with_index do |letter, i|
 			if line[i + 3] && (letter + line[i + 1]) == (line[i + 3] + line[i + 2]) && (letter != line[i + 2])
 				p (letter + line[i + 1]) + (line[i + 2] + line[i + 3])
 				count += 1
 			end
 		end
 	end
 	return count > 0
end

def abba2?(sequence)
	count = 0
	perms = []
 	sequence.scan(/\[(\w+)\]/).each do |line|
 		line = line[0].split("")
 		line.each_with_index do |letter, i|
 			if line[i + 2]
 				if line[i + 2] == letter
 					perms << letter + line[i + 1] + line[i + 2]
 				end
 			end
 		end
 	end
 	perms.uniq.each do |perm|
	 	sequence.scan(/(\w+)\[/).each do |line|
	 		line = line[0]
	 		line.split("").each_with_index do |letter, i|
 				if line[i + 2] && (perm[1] == letter) && (perm[1] == line[i + 2]) && (perm[0] == perm[2]) && (perm[0] == line[i + 1])
 					count += 1
 					p perm + ":"
 					p letter + line[i + 1] + line[i + 2]
 				end
	 		end
	 	end
	 sequence.scan(/\](\w+)/).each do |line|
	 		line = line[0]
	 		line.split("").each_with_index do |letter, i|
				if line[i + 2] && (perm[1] == letter) && (perm[1] == line[i + 2]) && (perm[0] == perm[2]) && (perm[0] == line[i + 1])
 					count += 1
  				p perm +":"
 					p letter + line[i + 1] + line[i + 2]
 				end
	 		end
	 	end
	end
 	return count > 0
end

def open_file(file)
	lines = []
	File.open(file, "r").each_line do |line|
		lines << line.gsub("\n", "")
	end
	lines
end

def split
	count = 0
	open_file("example7.txt").each do |sequence|
		count += 1 if abba?(sequence)
	end
	p count
end

split

def open_file(file)
	lines = []
	File.open(file, "r").each_line do |line|
		lines << line.gsub("\n", "")
	end
	lines
end


def recover_message
	message = []
	
	transpose.each do |line|
		frequency = {}
		line.each do |letter|
			if frequency[letter]
				frequency[letter] += 1
			else
				frequency[letter] = 1
			end
		end
		# Part 1
		#message << frequency.sort_by {|k,v| v}[-1][0]
		# Part 2
		message << frequency.sort_by {|k,v| v}[0][0]
	end
	p message.join("")
end

def transpose
	x = open_file("example6.txt").map do |string|
		string.split("")
	end.transpose
end

recover_message
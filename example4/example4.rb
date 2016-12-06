#Alphabet
ALPHABET = ("a".."z").to_a


#Part 2 solution
def room_name(letters_array, check_sum)
	name = []
	shift = check_sum.to_i
	until shift <= 26
		shift -= 26 
	end
	letters_array.each do |letters|
		word = []
		letters.split("").each do |letter|
			new_index = ALPHABET.index(letter) + shift
			if new_index >= 26
				new_index -= 26
			end
			word << ALPHABET[new_index]
		end
		name << word.join("")
	end
	#Print check_sum of northpole is included in answer
	p check_sum if name.include?("northpole")
end

def break_code
	# Total checksum score
	total_checksum = 0
	#Open File and get each line of code
	open_file("example4.txt").each do |line|
		next if line == nil 
		#Break up code to usable parts
		letters_to_check = line.split("[")[1][0..-2]
		letters, check_sum = line.split("[")[0].split("-")[0..-2], line.split("[")[0].split("-")[-1]
		#Check to see if it is a real room
		if real_room?(letters, letters_to_check)
			total_checksum += check_sum.to_i 
		end
		room_name(letters, check_sum)
	end
	p total_checksum
end

def real_room?(letters, letters_to_check)
	letter_score = {}
	sorted_letters = letters.join("").split("").sort
	#Creates a hash of the number of times a particular letter occurs within the code
	sorted_letters.each do |letter|
		if letter_score[letter]
			letter_score[letter] += 1
		else
			letter_score[letter] = 0
		end
	end
	#Takes the previous hash and creates a new hash of frequency => array of letters in that frequency
	freq = {}
	letter_score.sort_by {|k,v| v }.reverse.each do |letter|
		if freq[letter[1]]
			freq[letter[1]] << letter[0]
		else
			freq[letter[1]] = [letter[0]]
		end
		#Sort the array of letters in each frequnecy
		freq[letter[1]].sort!
	end
	answer_key = []
	#Get the number of letters to check(based on letters to check length) from the most used letters in the code
	freq.each do |k,v|
		v.each do |letter|
			if answer_key.length < letters_to_check.length 
				answer_key << letter 
			end
		end
	end
	#Check to see if the answer key is equal to the letters that need to be checked, and returns true or false
	if answer_key.join("") == letters_to_check
		return true
	else
		return false
	end
end

def open_file(file)
	#Break the file into an array
  lines = []
  new_format = File.open(file, "r+").each_line do |line|
    lines << line.gsub!("\n", "")
  end
  lines
end

#Run!
break_code
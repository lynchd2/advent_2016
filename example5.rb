require 'digest'

def code1(input)
	answer = ""
	i = 0
	md5 = Digest::MD5.new
	until answer.length == 8
		while (md5.hexdigest(input + i.to_s))[0..4] != "00000"
			i += 1
		end
		answer << md5.hexdigest(input + i.to_s)[5]
		i += 1
	end
	p answer
end

#code1("reyedfim")


def code2(input)
	answer = "--------"
	count = 0
	i = 0
	md5 = Digest::MD5.new
	until count == 8
		i += 1
		while (md5.hexdigest(input + i.to_s))[0..4] != "00000"
			i += 1
		end
		if (md5.hexdigest(input + i.to_s)[5]) =~ /[0-7]/ && (answer[md5.hexdigest(input + i.to_s)[5].to_i] == "-")
			p answer[md5.hexdigest(input + i.to_s)[5].to_i]
			answer[md5.hexdigest(input + i.to_s)[5].to_i] = md5.hexdigest(input + i.to_s)[6] 
			count += 1
			p answer
		end
	end
	p answer
end

t = Time.now
code2("abc")
p Time.now - t
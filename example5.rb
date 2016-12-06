require 'digest'

def code(input)
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

code("reyedfim")
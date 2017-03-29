def caesar_cipher(text, reps)

	if (reps >= 1)
		letter_array = text.split("")
		letter_array.map! do |letter| 
			if ( ("a".."z") === letter.downcase)
				if ( ("a".."w") === letter.downcase)
					letter.next!
				elsif ( ("x".."z") === letter.downcase)
					letter.next![-1]
				end
			else
				letter
			end
		end
	
	text = letter_array.join("")
	reps -= 1
	caesar_cipher(text, reps)
	
	else
		text
	end
end

puts "text: hello, reps: 1"
puts caesar_cipher("hello",1)

puts "text: xylophone, reps: 4"
puts caesar_cipher("xylophone",4)

puts "text: hello, reps: 0"
puts caesar_cipher("hello",0)

puts "text: elephant, reps: 2"
puts caesar_cipher("elephant",2)




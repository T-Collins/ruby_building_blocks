#pass results to store results during recursion, and first to ensure that the results are printed out
#even if text consists of only one word

def substrings(text, dictionary, results = {},first=true)
	input_words = text.downcase.split(" ")
	
	if (input_words.length > 1 || first)
		first = false
		input_words.each do |each_word|
			substrings(each_word, dictionary, results,first)
		end
		puts results
	else
		dictionary.each do |word| 
			if ( text.include?(word) )
				if (results.has_key?(word))
					results[word] += 1
				else
					results.store(word, 1)
				end
			end
		end
	end
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("Howdy partner, sit down! How's it going?", dictionary)


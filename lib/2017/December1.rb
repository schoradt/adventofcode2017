

class December1
  def December1.sumMatching(text)
    sum = 0

    lastNumber = 0

    text.each_char do |char|
    	number = char.to_i

    	puts number

    	if number == lastNumber then
    		sum += lastNumber
    	end

    	lastNumber = number;
  	end

  	number = text[0].to_i

	if number == lastNumber then
		sum += lastNumber
	end

    sum
  end
end

##
# This class is the advent of code excercise for December the 1 2017.
class December1
  ##
  # The function computes the sum of integers from the string, 
  # that matches its predecessor.
  def December1.sumMatching(text)
    sum = 0

    lastNumber = 0

    text.each_char do |char|
    	number = char.to_i

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

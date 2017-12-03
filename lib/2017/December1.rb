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

  ##
  # The function computes the sum of integers from the string, 
  # that matches half list around predecessor.
  def December1.sumMatching2(text)
    sum = 0

    line = [];

    text.each_char do |char|
      line.push(char.to_i)
    end    

    lastNumber = 0

    checkIndex = line.length / 2

    line.each_with_index do |number, index|
      check = line[checkIndex]

      if number == check then
        sum += number
      end

      checkIndex += 1

      if checkIndex == line.length then
        checkIndex = 0
      end
    end

    sum
  end  
end

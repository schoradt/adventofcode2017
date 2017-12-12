##
# This class is the advent of code excercise for December the 1 2017.
class December1
  ##
  # The function computes the sum of integers from the string, 
  # that matches its predecessor.
  def December1.sum_matching(text)
    sum = 0

    last_number = 0

    text.each_char do |char|
    	number = char.to_i

    	if number == last_number then
    		sum += last_number
    	end

    	last_number = number;
  	end

  	number = text[0].to_i

  	if number == last_number then
  		sum += last_number
  	end

    sum
  end

  ##
  # The function computes the sum of integers from the string, 
  # that matches half list around predecessor.
  def December1.sum_matching_2(text)
    sum = 0

    line = [];

    text.each_char do |char|
      line.push(char.to_i)
    end    

    check_index = line.length / 2

    line.each_with_index do |number, index|
      check = line[check_index]

      if number == check then
        sum += number
      end

      check_index += 1

      if check_index == line.length then
        check_index = 0
      end
    end

    sum
  end  
end

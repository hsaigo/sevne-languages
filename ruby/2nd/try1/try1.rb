numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]

counter = 0 ; four_numbers = []
numbers.each do |number|
  four_numbers << number
  counter += 1
  if counter == 4
    p four_numbers
    counter = 0; four_numbers = []
  end 
end

numbers.each_slice(4){|four_numbers| p four_numbers}


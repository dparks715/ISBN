#Deletes spaces and hypens from parameter.
def remove_spaces_hypens(isbn_num)
	isbn_num.delete(' ' '-')
end

#Made two functions to do letter check differently based on length
#If it is length 10 it checks only the first 9 characters
#using .chop because the last character CAN be a letter.
def letter_check_ten(isbn_num)
		num = isbn_num.chop.delete('0-9')
		if num.length == 0
			true
		else
			false
		end
end
#If it is 13 it checks all characters because there can be no letters.
def letter_check_13(isbn_num)
		num = isbn_num.delete('0-9')
		if num.length == 0
			true
		else
			false
		end
end

def check_last_index(isbn_num)
	if isbn_num[-1].match(/[0-9xX]/) #remove spaces or it will look for spaces as well
		true
	else
		false
	end

end

#Does the check digit calculation for ISBN 10, returns true if valid, false if not.
def isbn_ten_check_digit?(isbn_num)
	#Assigning variables for counters, and valid starts as false.  Will get assigned
	#true only if conditions/calculations are met.
	valid = false
	total = 0
	index_pos = 0
	index_count = 1
	#Use chop here because we dont use the last character to calculate the check digit.
	counter = isbn_num.chop
	#Loop length of 9, isbn_num length is 10, we .chop it to 9.
	#Iterates through each index position of the string and multiplies by its position.
	#Index position for ISBN numbers start at 1, not 0.
	#Adds each iteration to total
	counter.length.times do
				total = total + isbn_num[index_pos].to_i * index_count
				index_pos += 1
				index_count += 1
	end
	#Total mod 11 gets assigned to check_digit
	check_digit = total % 11
	#Testing the check digit against conditionals.  If check_digit equals 10, AND isbn_num
	#ends with 'x' or 'X', its a valid ISBN10
	if check_digit == 10 && !!isbn_num[-1].match(/[xX]/) == true
				valid = true
	#If check_digit does not equal ten, but matches the last character of isbn_num
	#It is a valid ISBN10.  Convert the last digit of isbn_num to an integer for proper comparison.
	elsif check_digit != 10 && isbn_num[-1].to_i == check_digit
				valid = true
	end
	#Calls valid, which is false if none of the conditions were met.
	#True if the calculations check out and ISBN is valid.
	valid

end

def isbn_thirteen_check_digit?(isbn_num)
	#Same variables, principal as isbn10 calculation, except even_odd
	#Use even_odd starting at 2, because I want to start on an even number
	valid = false
	total = 0
	index_pos = 0
	index_count = 1
	even_odd = 2
	counter = isbn_num.chop

	#even_odd is used here to alternate between multiplying by 1 and 3
	#If even_odd mod 2 equals 0 we have an even number, so multiply by 1
	#Otherwise multiply by 3
	#Add to total each iteration
	counter.length.times do
		if even_odd % 2 == 0
			total = total + isbn_num[index_pos].to_i * 1
		else
			total = total + isbn_num[index_pos].to_i * 3
		end
			even_odd += 1
			index_pos += 1
	end
	#Calculates check digit
	check_digit = (10 - (total % 10)) % 10
	#Compares check digit to last character of isbn_num
	if check_digit == isbn_num[-1].to_i
		valid = true
	else
		valid = false
	end
	valid
end

def check_valid_isbn_ten?(isbn_num)
	valid = false
	if letter_check_ten(isbn_num)
		if check_last_index(isbn_num)
			if isbn_ten_check_digit?(isbn_num)
				valid = true
			end
		end
	end
	valid
end

def check_valid_isbn_13?(isbn_num)
	valid = false
	if letter_check_13(isbn_num)
		if isbn_thirteen_check_digit?(isbn_num)
			valid = true
		end
	end
	valid
end

#Final function, determines the length of ISBN number and uses
#one of the combined functions above based on length 10 or 13
#Valid is set to false by default so all conditions must be true
#or valid never changes from false.
def check_valid_isbn?(isbn_num)
	valid = false
	isbn_new = remove_spaces_hypens(isbn_num)
	if isbn_new.length == 10
		if check_valid_isbn_ten?(isbn_new)
			valid = true
		end
	else isbn_new.length == 13
		if check_valid_isbn_13?(isbn_new)
			valid = true
		end
	end
	valid
end
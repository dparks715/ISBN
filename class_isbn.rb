#Deletes spaces from isbn_num
def remove_spaces(isbn_num)
	isbn_num.delete(' ')
end

#Deletes hypens from isbn_num
def remove_hypen(isbn_num)
	isbn_num.delete('-')
end

#Moved this from the top, because it checks for length of 10.
#Length can start out greater than 10 due to spaces and hypens.
#Ex. 1-2-3-4-5 6 7 8 9-X.  Much longer than 10 but all characters valid.
#So we must call this AFTER hypens and spaces are removed.
def isbn_length?(isbn_num)
#passing in a string, want boolean returned
	if isbn_num.length == 10
		true
	else
		false
	end
end

#Modifying to check only first 9 characters using .chop because
#the last character CAN be a letter.
#THIS NEEDS TO RUN AFTER SPACES AND HYPENS ARE REMOVED TO WORK
#BECAUSE WE ONLY REMOVE NUMBERS HERE!
#It will chop off the last character, then remove the numbers.
#Spaces, hypens, and numbers are gone so there should be nothing left
#if it is a valid ISBN
def letter_check(isbn_num)
	#Line 38 is calling 2 methods, .chop and .delete on our parameter isbn_num
	#.chop removes the last character from the string. .delete('0-9') targets
	#numbers in the string 0 to 9 and deletes them.  We assign whats left to
	#the variable num.  Then we check the length of num using == 0.
	#We expect 0 because we have removed numbers, spaces, and hypens, so
	#if anything is left, it is an invalid character.
		num = isbn_num.chop.delete('0-9')
		if num.length == 0
			true
		else
			false
		end
end

def check_last_index(isbn_num)
	if isbn_num.match(/[0-9xX]/) #remove spaces or it will look for spaces as well
		true
	else
		false
	end

end
#Does the check digit calculation for ISBN 10, returns true if valid, false if not.
def isbn_ten_valid?(isbn_num)
	#Assigning variables for counters, and valid, which will be our result.
	valid = false
	total = 0
	index_pos = 0
	index_count = 1
	#Use chop here because we dont use the last character to calculate the check digit.
	counter = isbn_num.chop
	#Loop length of isbn_num -1 (because of .chop)
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
	valid

end
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
#THIS NEEDS TO RUN AFTER SPACES AND HYPENS ARE REMOVED TO WORK!
#It will chop off the last character, then remove the numbers.
#Spaces, hypens, and numbers are gone so there should be nothing left
#if it is a valid ISBN
def letter_check(isbn_num)
	#Line 21 is calling 2 methods, .chop and .delete on our parameter isbn_num
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
	if isbn_num.match(/[0-9 x X]/)
		true
	else
		false
	end

end
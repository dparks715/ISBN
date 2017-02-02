#Need to come back and finish this function
#It should verify that the input is a string
#Ends in X or a number
#Contains only numbers, hypens, and spaces (except X on the end)

def check_isbn(isbn_num)
	valid = false
	nums = isbn_num.gsub(/[^0-9]/, "")

	# Checks a series of conditionals on isbn_num.
	if /\A/.match(isbn_num) && #Checks if isbn_num begins with string
		!!/X/.match(isbn_num[-1]) == true || #Checks if last index is X
		!!/x/.match(isbn_num[-1]) == true || #Checks if last index is x
		!!/\d/.match(isbn_num[-1]) == true #Checks if last index is 0-9

		#Had to do another if statement.
		#These conditionals wouldn't work in the list above
		#Checks that there are no consecutive hypens or spaces
		if !!/\-{2}/.match(isbn_num) == false &&
			!!/\s{2}/.match(isbn_num) == false
			valid = true

		end
	end
	valid
end



def verify_isbn(isbn_num)
	valid = false
	#If the value input returns true from check_isbn function, moves to if statement
	if check_isbn(isbn_num)
		#Strips everything but numbers from isbn_num
		#Puts them in string called nums
		nums = isbn_num.gsub(/[^0-9]/, "")
		total = 0
		index_pos = 0
		index_count = 1
		#Chopping off last part because we dont need the check digit for the calculation
		counter = nums.chop
		#Checks if the isbn_num is length 10, or length 9 with and X
		#Moves to the formula for determining the check digit if so
		if nums.length == 10 ||
			nums.length == 9 &&
			isbn_num[-1] == 'X' ||
			isbn_num[-1] == 'x'
			#Does the calculation for the check digit
			#Adds digit position times the value of the position converted to integer
			#To a variable called total
			counter.length.times do
				total = total + nums[index_pos].to_i * index_count
				index_pos += 1
				index_count += 1
			end
			#check_digit is our total mod 11
			check_digit = total % 11
			#If check_digit(total mod 11) is 10, checks that last character
			#of isbn_num is and x or X, returns true if so
			if check_digit == 10 && isbn_num[-1] == 'X' || isbn_num[-1] =='x'
				valid = true
			#If check_digit is not 10, then the last digit should be the check_digit
			#check_digit is an integer so to compare we need our string value .to_i(to integer)
			elsif check_digit != 10 && isbn_num[-1].to_i == check_digit
				valid = true
			end
		#Checks if the isbn_num is length 13 after being stripped
		#Uses the ISBN13 check digit formula if so
		else nums.length == 13
			even_odd = 2
			#Uses an even or odd counter to determine whether to multiply
			#by 1 or 3, adds to a variable called total
			counter.length.times do
				if even_odd % 2 == 0
					 total = total + nums[index_pos].to_i * 1
				else
						total = total + nums[index_pos].to_i * 3
				end
				even_odd += 1
				index_pos += 1
			end
			#Does the math for determining the check_digits value
			check_digit = (10 - (total % 10)) % 10
			#True if the check digit matches the last index pos of the ISBN
			#Convert to integer because comparing integer to string
			if check_digit == isbn_num[-1].to_i
				valid = true
			else
				valid = false
			end
		end
	end
valid
end
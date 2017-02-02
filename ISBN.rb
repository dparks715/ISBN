def check_isbn(isbn_num)
	valid = false

	# Checks a series of conditionals on isbn_num.
	if /\A/.match(isbn_num) && #Checks if isbn_num begins with string
		!!/\s{2}/.match(isbn_num) == false && #Checks there are no consecutive spaces
		!!/X/.match(isbn_num[-1]) == true || #Checks if last index is X
		!!/x/.match(isbn_num[-1]) == true || #Checks if last index is x
		!!/\d/.match(isbn_num[-1]) == true #Checks if last index is 0-9

		#Had to do another if statement. could not get this conditional to work in
		#the list above for some reason.
		#Checks that there are no consecutive hypens
		if !!/\-{2}/.match(isbn_num) == false 
			valid = true
		end
	end
	valid
end



def verify_isbn_ten(isbn_num)
	valid = false
	#If the value input returns true from check_isbn function, moves to if statement
	if check_isbn(isbn_num)
		#Strips everything but numbers from isbn_num
		#Puts them in string called nums
		nums = isbn_num.gsub(/[^0-9]/, "")
		total = 0
		index_pos = 0
		index_count = 1
		#Does the calculation for the check digit
		#Adds digit position times the value of the position converted to integer
		#To a variable called total
		nums.length.times do
			total = total + nums[index_pos].to_i * index_count
			index_pos += 1
			index_count += 1
		end
		#check_digit is our total mod 11
		check_digit = total % 11
		#If check_digit(total mod 11) is 10, checks that last character
		#of isbn_num is and x or X, returns true if so
		if check_digit == 10 && isbn_num[-1] == 'X' || 'x'
			valid = true
		#If check_digit is not 10, then the last digit should be the check_digit
		#check_digit is an integer so to compare we need our string value .to_i(to integer)
		elsif check_digit != 10 && isbn_num[-1].to_i == check_digit
			valid = true
		end
	end
valid
end
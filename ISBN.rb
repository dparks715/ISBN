def check_isbn(isbn_num)
	valid = false

	# Checks a series of conditionals on isbn_num.
	if /\A/.match(isbn_num) && #Checks if isbn_num begins with string
		!!/\s{2}/.match(isbn_num) == false && #Checks there are no consecutive spaces
		!!/X/.match(isbn_num[-1]) == true || #Checks if last index is X
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
	if check_isbn(isbn_num)
		nums = isbn_num.gsub(/[^0-9]/, "")
		total = 0
		index_pos = 0
		index_count = 1
		nums.length.times do
			total = nums[index_pos].to_i + index_count
			index_count += 1
		end
		if total % 11 == 10 && isbn_num[-1] == 'X'
			valid = true
		else total % 11 != 10 && isbn_num[-1].to_i == total
			valid = true
		end
	end
valid
end
def check_isbn(isbn_num)
	valid = false
	#checks the last index position of isbn_num for 0-9 or X
	#if both conditions are not met, ISBN is not valid, returns false
	if /\A/.match(isbn_num) &&
		!!/X/.match(isbn_num[-1]) == true ||
		!!/\d/.match(isbn_num[-1]) == true
		
		valid = true
	end
	valid
end
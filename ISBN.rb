def check_isbn(isbn_num)
	#checks the last index position of isbn_num for 0-9 or X
	#if both conditions are not met, ISBN is not valid, returns false
	if /X/.match(isbn_num[-1]) == nil && /\d/.match(isbn_num[-1]) == nil
		false
	#checks that isbn_num is the beginning of a string, then returns true
	else /\A/.match(isbn_num)
		true
	end

end
def check_isbn(isbn_num)
	if /X/.match(isbn_num[-1]) == nil && /\d/.match(isbn_num[-1]) == nil
		false
	else /\A/.match(isbn_num)
		true
	end

end
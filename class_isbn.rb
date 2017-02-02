def isbn_length?(isbn_num)
#passing in a string, want boolean returned
	if isbn_num.length == 10
		true
	else
		false
	end
end

def remove_spaces(isbn_num)
	isbn_num.delete(' ')
end

def remove_hypen(isbn_num)
	isbn_num.delete('-')
end

def letter_check(isbn_num)
		!!isbn_num.match(/[a-z A-Z]/)
end
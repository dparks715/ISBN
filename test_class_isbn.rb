require 'minitest/autorun'
require_relative 'class_isbn.rb'

#Removed the length tests because I repurposed that function
#to call other functions based on length

#class TestISBNLength < Minitest::Test
#
#	def test_ten_length_is_10
#		results = isbn_length?('1234567890')
#		assert_equal(true, results)	
#	end
#
#	def test_nine_length_9
#		results = isbn_length?('123456789')
#		assert_equal(false, results)	
#	end
#
#	def test_ten_length_alphabet_ten
#		results = isbn_length?('abcdefghij')
#		assert_equal(true, results)	
#	end
#
#	def test_13_length_alphabet_13_true
#		results = isbn_length?('abcdefghijbvc')
#		assert_equal(true, results)	
#	end
#
#end

class TestRemoveSpacesHyphens < Minitest::Test

	def test_remove_spaces
		results = remove_spaces_hypens('12  3 4 5')
		assert_equal('12345', results)
	end

	def test_remove_hypens
		results = remove_spaces_hypens('1-2-3-4-5')
		assert_equal('12345', results)
	end

	def test_remove_hypens_and_spaces
		results = remove_spaces_hypens('1-2-3-4-5 6 7 8 9')
		assert_equal('123456789', results)
	end

end

class TestforLetters < Minitest::Test

	def test_for_letters_in_first_nine
		results = letter_check_13('123mng456l456')
		assert_equal(false, results)
	end

	def test_letters_13_zero
		results = letter_check_13("978w470059029")
		assert_equal(false, results)
	end

	def test_ten_length_with_X_true
		results = letter_check_ten('123456789X')
		assert_equal(true, results)
	end

	def test_ten_length_without_X_true
		results = letter_check_ten('1234567890')
		assert_equal(true, results)
	end
	#Still returns true because not checking for X yet.
	def test_ten_length_with_letter_false
		results = letter_check_ten('123456789b')
		assert_equal(true, results)
	end

	def test_ten_symbol_false
		results = letter_check_ten('12345%6789')
		assert_equal(false, results)
	end

end

class TestcheckLastindex < Minitest::Test

	def test_last_index_X
		results = check_last_index('12345X')
		assert_equal(true, results)
	end

	def test_last_index_lowercase_x
		results = check_last_index('12345x')
		assert_equal(true, results)
	end

	def test_last_index_false_character
		results = check_last_index('123457g')
		assert_equal(false, results)
	end

end

class TestISBNtenCalc < Minitest::Test

	def test_valid_check_digit_ten_true
		results = isbn_ten_check_digit?("877195869x")
		assert_equal(true, results)	
	end

	def test_valid_check_digit_true_no_X
		results = isbn_ten_check_digit?("0471958697")
		assert_equal(true, results)	
	end

	def test_invalid_check_digit_false
		results = isbn_ten_check_digit?("123195869X")
		assert_equal(false, results)	
	end

	def test_invalid_check_digit_false_no_X
		results = isbn_ten_check_digit?("1256786912")
		assert_equal(false, results)	
	end

end

class TestISBN13Valid < Minitest::Test

	def test_valid_check_digit_13_true
		results = isbn_thirteen_check_digit?("9780470059029")
		assert_equal(true, results)
	end

end

class TestISBNtenCombined < Minitest::Test

	def test_valid_isbn_ten_true
		results = combined_isbn_ten?("877195869x")
		assert_equal(true, results)
	end

	def test_valid_isbn_ten_true_no_X
		results = combined_isbn_ten?("0471958697")
		assert_equal(true, results)	
	end

	def test_invalid_isbn_ten_false
		results = combined_isbn_ten?("123195869X")
		assert_equal(false, results)	
	end

	def test_invalid_isbn_ten_false_no_X
		results = combined_isbn_ten?("1256786912")
		assert_equal(false, results)	
	end

end

class TestISBNthirteenCombined < Minitest::Test

	def test_valid_isbn_13_true
		results = combined_isbn_13?("9780470059029")
		assert_equal(true, results)
	end

	def test_isbn_13_with_letter
		results = combined_isbn_13?("978w470059029")
		assert_equal(false, results)
	end

	def test_valid_isbn_13_true
		results = combined_isbn_13?("4780470059029")
		assert_equal(false, results)
	end

end

class TestValidISBNFinal < Minitest::Test
	#ISBN 10 Tests
	def test_final_valid_isbn_ten_true
		results = check_valid_isbn?("0471958697")
		assert_equal(true, results)		
	end

	def test_final_valid_isbn_spaces_hypens_true
		results = check_valid_isbn?("04  7--1-95 8 697")
		assert_equal(true, results)		
	end

	def test_final_valid_isbn_spaces_hypens_true_X
		results = check_valid_isbn?("8 7 7--19-5869x")
		assert_equal(true, results)		
	end

	def test_invalid_isbn_ten_false_no_X
		results = check_valid_isbn?("1256786912")
		assert_equal(false, results)	
	end
	#ISBN 13 tests
	def test_valid_isbn_13_true
		results = check_valid_isbn?("97 8w47-005-902 9")
		assert_equal(false, results)
	end

	def test_valid_isbn_13_true_v2
		results = check_valid_isbn?("4780470059029")
		assert_equal(false, results)
	end
	#Random tests with invalid characters
	def test_invalid_false
		results = check_valid_isbn?("97 8047-005g902 9")
		assert_equal(false, results)
	end

	def test_invalid_false_symbol
		results = check_valid_isbn?("97 8047-*05902 9")
		assert_equal(false, results)
	end

	def test_check_valid
		results = check_valid_isbn?('0132971291')
		assert_equal(true, results)
	end

	def test_check_valid_v2
		results = check_valid_isbn?('0294566082')
		assert_equal(true, results)
	end

	def test_check_valid_empty_string_false
		results = check_valid_isbn?('')
		assert_equal(false, results)
	end

	def test_check_invalid_hyphen_false
		results = check_valid_isbn?('-')
		assert_equal(false, results)
	end

	def test_check_7777777777
		results = check_valid_isbn?('7777777777')
		assert_equal(true, results)
	end

end
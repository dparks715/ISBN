require 'minitest/autorun'
require_relative 'class_isbn.rb'

class TestISBNLength < Minitest::Test

	def test_ten_length_is_10
		results = isbn_length?('1234567890')
		assert_equal(10, results)	
	end

	def test_nine_length_9
		results = isbn_length?('123456789')
		assert_equal(9, results)	
	end

	def test_ten_length_alphabet_ten
		results = isbn_length?('abcdefghij')
		assert_equal(10, results)	
	end

end

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

	def test_ten_length_with_X_true
		results = letter_check_ten('123456789X')
		assert_equal(true, results)
	end

	def test_ten_length_without_X_true
		results = letter_check_ten('1234567890')
		assert_equal(true, results)
	end

	def test_ten_length_with_letter_false
		results = letter_check_ten('123456789b')
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

	def test_valid_isbn_ten_true
		results = isbn_ten_valid?("877195869x")
		assert_equal(true, results)	
	end

	def test_valid_isbn_ten_true_no_X
		results = isbn_ten_valid?("0471958697")
		assert_equal(true, results)	
	end

	def test_invalid_isbn_ten_false
		results = isbn_ten_valid?("123195869X")
		assert_equal(false, results)	
	end

	def test_invalid_isbn_ten_false_no_X
		results = isbn_ten_valid?("1256786912")
		assert_equal(false, results)	
	end

end

class TestISBN13Valid < Minitest::Test

	def test_valid_isbn_13_true
		results = isbn_thirteen_valid?("9780470059029")
		assert_equal(true, results)
	end

end
require 'minitest/autorun'
require_relative 'class_isbn.rb'

class TestISBNLength < Minitest::Test

	def test_ten_length_true
		results = isbn_length?('1234567890')
		assert_equal(true, results)	
	end

	def test_nine_length_false
		results = isbn_length?('123456789')
		assert_equal(false, results)	
	end

	def test_ten_length_alphabet_true
		results = isbn_length?('abcdefghij')
		assert_equal(true, results)	
	end

end

class TestRemoveSpaces < Minitest::Test

	def test_remove_spaces
		results = remove_spaces('12  3 4 5')
		assert_equal('12345', results)
	end

end

class TestRemoveHypens < Minitest::Test

	def test_remove_hypens
		results = remove_hypen('1-2-3-4-5')
		assert_equal('12345', results)
	end

end

class TestforlettersAndLength < Minitest::Test

	def test_for_letters_in_first_nine
		results = letter_check('123mng456lkd3')
		assert_equal(false, results)
	end

	def test_no_letters_true
		results = letter_check('123456789X')
		assert_equal(true, results)
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
		assert_equal(true, results)
	end

end

class TestISBNtenCalc < Minitest::Test

	def test_valid_isbn_ten_true
		results = isbn_ten_valid?("877195869x")
		assert_equal(true, results)	
	end

end
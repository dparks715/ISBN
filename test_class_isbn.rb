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
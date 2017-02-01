require 'minitest/autorun'
require_relative 'ISBN.rb'

class TestISBNFunction < Minitest::Test
	def test_ISBN_is_string
		results = check_isbn('12345')
		assert_equal(true, results)	
	end

	def test_last_char
		results = check_isbn('12345')
		assert_equal(true, results)
	end

	def test_last_char_X
		results = check_isbn('12345X')
		assert_equal(true, results)
	end

end
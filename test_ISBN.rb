require 'minitest/autorun'
require_relative 'ISBN.rb'

class TestISBNFunction < Minitest::Test
#	def test_ISBN_is_string
#		isbn = '12345'
#		assert_equal(String, check_isbn(isbn))	
#	end

	def test_last_char
		isbn = check_isbn('12345')
		assert_equal(true, isbn)
	end

end
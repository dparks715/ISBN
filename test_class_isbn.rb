require 'minitest/autorun'
require_relative 'class_isbn.rb'

class TestISBNFunction < Minitest::Test
	def test_ISBN_is_string
		results = check_isbn('1234567890')
		assert_equal(true, results)	
	end
end
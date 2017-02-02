require 'minitest/autorun'
require_relative 'class_isbn.rb'

class TestISBNFunction < Minitest::Test

	def test_ten_length_true
		results = check_isbn('1234567890')
		assert_equal(true, results)	
	end

	def test_nine_length_false
		results = check_isbn('123456789')
		assert_equal(false, results)	
	end

end
require 'minitest/autorun'
require_relative 'ISBN.rb'

class TestISBNFunction < Minitest::Test
	def test_ISBN_is_string
		results = check_isbn('12345')
		assert_equal(true, results)	
	end

	def test_last_char_true
		results = check_isbn('12345')
		assert_equal(true, results)
	end

	def test_last_char_X_true
		results = check_isbn('12345X')
		assert_equal(true, results)
	end

	def test_last_char_false
		results = check_isbn('12345t')
		assert_equal(false, results)
	end

	def test_no_consecutive_spaces_true
		results = check_isbn('1 2 3 4 5')
		assert_equal(true, results)
	end

	def test_consecutive_spaces_false
		results = check_isbn('12  3  45')
		assert_equal(false, results)
	end

	def test_no_consecutive_hyphens_true
		results = check_isbn('1-2-3-4-5-6-7-8-9')
		assert_equal(true, results)
	end

	def test_consecutive_hypens_false
		results = check_isbn('1234--56')
		assert_equal(false, results)
	end
end

class TestISBNTen < Minitest::Test

	def test_valid_ISBN_true
		results = verify_isbn("0-321-14653-0")
		assert_equal(true, results)
	end

	def test_valid_ISBN_true_with_X
		results = verify_isbn("877195869x")
		assert_equal(true, results)
	end
	
	def test_invalid_ISBN_false
		results = verify_isbn("4780470059029")
		assert_equal(false, results)
	end

	def test_ISBN_extra_hypen_false
		results = verify_isbn("0--321-14653-0")
		assert_equal(false, results)
	end

	def test_ISBN13_valid_true
		results = verify_isbn("9780470059029")
		assert_equal(true, results)
	end

	def test_ISBN10_valid_true
		results = verify_isbn("0471958697")
		assert_equal(true, results)
	end
	
	def test_ISBN13_valid_true_with_hypens
		results = verify_isbn("978-0-13-149505-0")
		assert_equal(true, results)
	end

	def test_ISBN13_valid_true_with_spaces
		results = verify_isbn("978 0 471 48648 0")
		assert_equal(true, results)
	end
end


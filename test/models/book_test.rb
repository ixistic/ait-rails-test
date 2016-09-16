require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "should validate presence of name" do
    book = Book.new
    assert !book.valid?
    assert_equal ["can't be blank"], book.errors[:name]
  end

  test "should validate presence of price" do
    book = Book.new
    assert !book.valid?
    assert_equal ["can't be blank"], book.errors[:price]
  end


  test "should validate uniqueness of name" do
    old_book = books(:one)
    book = Book.new name: old_book.name
    assert !book.valid?
    assert_equal ["has already been taken"], book.errors[:name]
  end
end

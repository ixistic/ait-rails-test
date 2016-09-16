require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post books_url, params: { book: { category_id: @book.category_id, description: @book.description, name: 'ice', price: @book.price } }
    end

    assert_redirected_to book_url(Book.last)
  end

  test "should validate book on create" do
    assert_no_difference('Book.count') do
      post books_url, params: { book: { category_id: @book.category_id, description: @book.description, name: @book.name, price: @book.price } }
    end
    assert_response :success
    assert_template 'new'
    assert_select 'li', 'Name has already been taken'
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { category_id: @book.category_id, description: @book.description, name: @book.name, price: @book.price } }
    assert_redirected_to book_url(@book)
  end

  test "should validate book on update" do
    patch book_url(@book), params: { book: { category_id: @book.category_id, description: @book.description, name: books(:two).name, price: @book.price } }
    assert_response :success
    assert_template 'edit'
    assert_select 'li', 'Name has already been taken'
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end
end

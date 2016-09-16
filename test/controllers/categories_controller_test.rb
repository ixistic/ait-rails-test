require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @category = categories(:one)
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    sign_in sessions(:one)
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    sign_in sessions(:one)
    assert_difference('Category.count') do
      post categories_url, params: { category: { name: 'ice' } }
    end

    assert_redirected_to category_url(Category.last)
  end

  test "should validate category on create" do
    sign_in sessions(:one)
    assert_no_difference('Category.count') do
      post categories_url, params: { category: { name: @category.name } }
    end
    assert_response :success
    assert_template 'new'
    assert_select 'li', 'Name has already been taken'
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  test "should get edit" do
    sign_in sessions(:one)
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    sign_in sessions(:one)
    patch category_url(@category), params: { category: { name: @category.name } }
    assert_redirected_to category_url(@category)
  end

  test "should validate category on update" do
    sign_in sessions(:one)
    patch category_url(@category), params: { category: { name: categories(:two).name } }
    assert_response :success
    assert_template 'edit'
    assert_select 'li', 'Name has already been taken'
  end

  test "should destroy category" do
    sign_in sessions(:one)
    assert_difference('Category.count', -1) do
      delete category_url(@category)
    end

    assert_redirected_to categories_url
  end
end

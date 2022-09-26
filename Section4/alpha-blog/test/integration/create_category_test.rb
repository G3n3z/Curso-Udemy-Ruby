require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  setup do

    @admin = User.create(username: "John", email: "john@example.com", password: "asd", admin: true)
  end

  test "get new category form and create category" do
    sign_in_as(@admin)
    get new_category_url
    assert_response :success

    assert_difference 'Category.count', 1 do
      post categories_path, params: {category: {name: "Sports"}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success

    assert_match("Sports", response.body)
  end

  test "get new category form and reject invalid category submission" do
    sign_in_as(@admin)
    get new_category_url
    assert_response :success

    assert_no_difference 'Category.count' do
      post categories_path, params: {category: {name: " "}}
    end

    assert_match("errors", response.body)
    assert_select('div.alert')
    assert_select('h4.alert-heading')
  end
end
require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
    test "should get index" do
        get categories_path 
        assert_response :success
    end

    test "should get show" do
        @category = Category.new(name: "sports")
        @category.save! 
        get category_path(@category)
        assert_response :success
    end

    test "should get new" do
        get new_category_path
        assert_response :success
    end

end
require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
    
    def setup
        @user = User.create(email: 'sahil@ss.sss', 
        username: 'sahil', 
        password: "ssssss",
        admin: true)
        @category = Category.create(name: "sports")
    end
    
    test "should get index" do
        get categories_path 
        assert_response :success
    end

    test "should get show" do
        @category.save! 
        get category_path(@category)
        assert_response :success
    end

    test "should get new" do
        sign_in_as(@user.email, @user.password)
        
        get new_category_path
        assert_response :success
    end

    test "should redirect to if not loggedin as admin" do
        assert_no_difference "Category.count" do
            post categories_path, params: { category: { name: "books"}}
        end
        assert_redirected_to categories_path
    end

end
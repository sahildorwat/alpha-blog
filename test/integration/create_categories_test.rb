require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
    def setup
        @user = User.create(email: 'sahil@ss.sss', 
        username: 'sahil', 
        password: "ssssss",
        admin: true)
        sign_in_as(@user.email, @user.password)
    end
    
    test "get new category form and create category" do
        get new_category_path 
        assert_template 'categories/new'
        assert_difference "Category.count", 1 do
            post categories_path , params: {category: {name: "sports"}}
        end
        # assert_template 'categories/index'
        # assert_match "sports", response.body
    end

    test "Invalid category submission results in failure" do
        get new_category_path 
        assert_template 'categories/new'
        assert_difference "Category.count", 0 do
            post categories_path , params: {category: {name: "sp"}}
        end
        assert_template 'categories/new'
        # assert-match "sports", response.body
        assert_select 'h2.panel-title'
        assert_select 'div.panel-body'
    end

end
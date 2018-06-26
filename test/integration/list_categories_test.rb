require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

    def setup
        @category = Category.new(name: "books")
        @category2 = Category.new(name: "internet")
    end

    test "should show categories listings " do
        get categories_path
        assert_template 'categories/index'
        # assert-select "a[href=?]", category_path(@category), text: @category.name
        # assert-select "a[href=?]", category_path(@category2), text: @category2.name
    end
end
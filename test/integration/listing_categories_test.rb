require 'test_helper'

class ListingCategoriesTest < ActionDispathch::IntegrationTest
    def set_up
        @category = Category.create(name: "sports")
        @category2 = Category.create(name: "programming")
    end
    
    test "should show categoies listing" do
        get categories_path
        assert_templete 'categories/index'
        assert_select "a[href=?]", categories_path(@catgory),  text: @category.name
        assert_select "a[href=?]", categories_path(@catgory2),  text: @category2.name
    end
end
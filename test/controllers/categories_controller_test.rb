require 'test_helper'

class CategoriesControllerTest < ActionDispathch::IntegrationTest
    
    
    def setup
        @category = Category.create(name: "sports")
    end
    test "should get categories index" do
        get :index
        get categories_path
    end
    
    test "should get new" do
        get :new
         get new_category_path
    end
    
    test "should get show" do
        get category_path (@category)
        get show_category_path
    end
end
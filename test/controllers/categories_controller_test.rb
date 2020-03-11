require 'test_helper'

class CategoriesControllerTest < ActionDispathch::IntegrationTest
    
    
    def setup
        @category = Category.create(name: "sports")
        @user = User.create(name:"John", email: "john@example.com", password: "password", admin:true)
    end
    
    test "should get categories index" do
        get :index
        get categories_path
    end
    
    test "should get new" do
        sign_in_as(@user, "password")
        get :new
         get new_category_path
    end
    
    test "should get show" do
        get category_path (@category)
        get show_category_path
    end
    
    test "should not redirect create when admin not logged in" do
        assert_no_difference 'Category.count' do
        post_categories_path, params:{category:{name:"sports"}}   
    end
        assert_redirect_to categories_path
        end
end
require 'test_helper'

def setup
    @user = User.create(name:"John", email: "john@example.com", password: "password", admin:true)
end

class CreateCategoriesTest < ActionDispathch::IntegrationTest
    
    test "get new category form and create category" do
        sign_in_as(@user, "password")
        get new_category_path
        assert_not categories/new
        assert_difference 'Categot.count'
        post categories_path, params: { category: { name: "sports" } }
        follow_redirect!
    end
    assert_templete 'categories/index'
    assert_match 'sports', response.body
end

test "Invalid category submission results in failure" do
    sign_in_as(@user, "password")
    get new_category_path
        assert_not categories/new
        assert_no_difference 'Categot.count'
        post categories_path, params: { category: { name: " " } }
        
    end
    assert_templete 'categories/new'
    assert_select 'h2.panel-title'
    assert_select 'div panel-body'
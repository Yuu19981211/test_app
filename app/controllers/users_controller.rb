class UsersController < ApplicationController
    def new 
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Welcome!"
            redirect_to articles_path
        else
            render 'new'
        end
    end
    
private
    def user_params
        params_require(:user).permit(:username, :email, :password)
    end
end
class UsersController < ApplicationController
    before_action :set_user, only[:edit, :update, :show]
    before_action :require_same_user, only[:edit, :udpate, :show]
    
    
    def index
        @users = User.paginate(page: params[:pages], per_page:5 )
    end

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
    
    def edit
    end
    
    def update
         if @user.updated(user_params)
             flash[:success] = "Updated"
             redirect_to articles_path
         else
             render 'edit'
         end
    end
    
    def show
        @user = User.find(params[:id])
        @user_article = article.paginate(page: params[:pages], per_page:5 )
    end
    
   
    
private
    def user_params
        params_require(:user).permit(:username, :email, :password)
    end
    
     def set_user
        @user = User.new(user_params)
    end
end
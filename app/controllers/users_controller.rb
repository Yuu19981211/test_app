class UsersController < ApplicationController
    before_action :set_user, only[:edit, :update, :show]
    before_action :require_same_user, only[:edit, :udpate, :show, :destroy]
    before_action :require_admin, omly[:destroy]
    
    
    def index
        @users = User.paginate(page: params[:pages], per_page:5 )
    end

    def new 
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "Welcome!"
            redirect_to articles_path(@user)
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
    
    def destroy
        @user = User.find(params[:user_id])
        @user.destroy
        flash[:danger] = "Your article and profile has been deleted"
        redirect_to user_path
    end
    
   
    
private
    def user_params
        params_require(:user).permit(:username, :email, :password)
    end
    
     def set_user
        @user = User.new(user_params)
    end
    
    def require_same_user
        if current_user != @user and !current_user.admin?
            flash[:danger] = "You can only edit on your account"
            redirect_to root_path
        end
    end
    
    def require_admin
        if logged_in and :current_user.admin?
            flsh[:danger] = "Admin User can perfom that action"
            redirect_to root_path
        end
    end
end
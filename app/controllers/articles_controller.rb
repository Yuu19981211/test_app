class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    
    def index
        @articles = Article.paginate(page: params[:pages], per_page:5 )
    end
    
    def new
    @article = Article.new
    end
    
    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:success] = "Article was created successfully"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end
    
    def show
    end
    
    def edit
        
    end
    
    def update
        
      if @article.update(article_params)
          flash[:sucess] = "created successfully"
         redirect_to article_path(@article)
      else
          render 'edit'
      end
    end
    
    def destroy
        @article.destroy
        flash[:danger] = "Deleted!"
        redirect_to articles_path
    end
    
    
private
  def set_article
       @article = Article.find(params[:id])
  end
  def article_params
      params.require(:article).permit(:title, :description)
  end
end
class ArticlesController < ApplicationController
   # before_action :authenticate_user!,except: [:index,:show]
    before_action :get_article,only: [:show,:edit,:update,:destroy]
    
    def index
        @articles = Article.descending_order
    end
    
    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:success] = "Article has been created."
            redirect_to articles_path
        else
            flash.now[:danger] = "Article has not been created."
            render 'new'
        end
    end
    
    def show  
    end
    
    def edit
    end
    
    def update
        if @article.update(article_params)
            flash[:success] = "Article was successfully updated."
            redirect_to article_path(@article)
        else
            flash.now[:danger] = "Fail to update article."
            render 'edit'
        end
    end
    
    def destroy
        if @article.destroy
            flash[:success] = "The article was successfully deleted."
            redirect_to articles_path
        else
            flash[:danger] = "Fail to delete article."
            redirect_to articles_path
        end
    end
    
    protected 
    def resource_not_found
        message = "The article that you are looking for cannot be found."
        flash[:danger] = message
        redirect_to root_path
    end
    
    private
    def article_params
        params.require(:article).permit(:title,:body)
    end
    
    def get_article
         @article = Article.find(params[:id])
    end
end

class ArticlesController < ApplicationController
    skip_before_action :authenticate_user!,only:[:index,:show]
    before_action :get_article,only: [:show,:edit,:update,:destroy]
    
    def index
        @articles = Article.descending_order
    end
    
    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(article_params)
        @article.user = current_user
        if @article.save
            flash[:success] = "Article has been created."
            redirect_to articles_path
        else
            flash.now[:danger] = "Article has not been created."
            render 'new'
        end
    end
    
    def show  
        @comments = @article.comments.build
    end
    
    def edit
        unless current_user == @article.user
            flash[:danger] = "You can only edit your own article."
            redirect_to root_path
        end
    end
    
    def update
        unless current_user == @article.user
            flash[:danger] = "You can only edit your own article."
            redirect_to root_path
        else
            if @article.update(article_params)
                flash[:success] = "Article was successfully updated."
                redirect_to article_path(@article)
            else
                flash.now[:danger] = "Fail to update article."
                render 'edit'
            end
        end
    end
    
    def destroy
        unless current_user == @article.user
            flash[:danger] = "You can only delete your own article."
        else
            if @article.destroy
                flash[:success] = "The article was successfully deleted."
                redirect_to articles_path
            else
                flash[:danger] = "Fail to delete article."
                redirect_to articles_path
            end
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

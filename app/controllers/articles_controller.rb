class ArticlesController < ApplicationController
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
            @article = Article.find(params[:id])
    end
    def edit
        @article = Article.find(params[:id])
    end
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:success] = "Article was successfully updated."
            redirect_to article_path(@article)
        else
            flash.now[:danger] = "Fail to update article."
            render 'edit'
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
end

class CommentsController < ApplicationController
    before_action :set_article
    
    def create
        @comment = @article.comments.build(comment_params)
        @comment.user = current_user
        
        if @comment.save
            flash[:notice] = "Comment has been created."
            ActionCable.server.broadcast "comment_channel",render(partial: 'articles/comment', object: @comment ) 
        else
            flash.now[:danger] = "Comment has not been created."
        end
    end
    
    private
    def comment_params
        params.require(:comment).permit(:body)
    end
    def set_article
        @article = Article.find(params[:article_id])
    end
end

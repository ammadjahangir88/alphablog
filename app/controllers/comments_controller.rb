class CommentsController < ApplicationController

    def new
        @comments=Comment.new
    end


    def index
        @comments=Comment.all

    end
    def create
    @article= Article.find(13)
    @comments=Comment.new(comment_params)
    @comments.user= User.find(session[:user_id])
    @comments.article= Article.find(13)
    respond_to do |format|
    if @comments.save
        format.html { redirect_to @comments.article, notice: "Comment Created" }  
      else
        format.html { render :new, status: :unprocessable_entity }
      end       
    end
    end

    
    
    private
    def comment_params
        params.require(:comment).permit(:comment,:user_id,:article_id)

    end

end
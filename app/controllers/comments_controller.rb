class CommentsController < ApplicationController

    def new
        @comments=Comment.new
    end


    def index
        @comments=Comment.all
<<<<<<< HEAD

    end
    def create
    @article= Article.find(13)
    @comments=Comment.new(comment_params)
    @comments.user= User.find(session[:user_id])
    @comments.article= Article.find(13)
    respond_to do |format|
    if @comments.save
        format.html { redirect_to @comments.article, notice: "Comment Created" }  
=======
    end
    def create
    @comments=Comment.new(comment_params)
    @comments.user= current_user
    @comments.article= Article.find(params[:article_id])
    respond_to do |format|
    if @comments.save
        format.html { redirect_to user_article_path(current_user,@comments.article), notice: "Comment Created" }  
>>>>>>> 40b5d358eed49f362d44871baafb3f25321a8c4a
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
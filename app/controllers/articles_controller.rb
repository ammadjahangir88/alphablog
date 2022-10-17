class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy]
<<<<<<< HEAD
=======
    before_action :require_same_user, only: [:edit, :update]
>>>>>>> 40b5d358eed49f362d44871baafb3f25321a8c4a
    def index
        @articles=Article.all
    end

    def  new
        @article = Article.new
    end

    def create

        @article = Article.new(article_params)
<<<<<<< HEAD
        @article.user= User.find(1)
        respond_to do |format|
        if @article.save
            format.html { redirect_to article_path(@article), notice: "Atricle was successfully created." }  
=======
        @article.user= User.find(session[:user_id])
        respond_to do |format|
        if @article.save
            CrudNotificationMailer.create_notification(@article).
            deliver_now
            format.html { redirect_to user_article_path(current_user,@article), notice: "Atricle was successfully created." }  
>>>>>>> 40b5d358eed49f362d44871baafb3f25321a8c4a
          else
            format.html { render :new, status: :unprocessable_entity }
          end       
        end 
    end
    def edit
        
    end

    def update
       
        respond_to do |format|
            if @article.update(article_params)
<<<<<<< HEAD
                format.html { redirect_to article_path(@article), notice: "Atricle was successfully Updated." }  
=======
                CrudNotificationMailer.update_notification(@article).
                 deliver_now
                format.html { redirect_to user_article_path(current_user,@article), notice: "Atricle was successfully Updated." }  
>>>>>>> 40b5d358eed49f362d44871baafb3f25321a8c4a
              else
                format.html { render :new, status: :unprocessable_entity }
              end       
            end 
    end


    def show
    end
    def pdf
        @article= Article.find(params[:id])
        pdf= Prawn::Document.new
        pdf.text @article.title, size: 48, style: :bold
        pdf.text @article.description, size: 28
        image=StringIO.open(@article.image.download)
        pdf.image image, fit: [500,500]
        send_data(pdf.render,
                  filename: '#{@article.title}.pdf',
                  type: 'application/pdf',
                  disposition: 'inline')


    end
    def search
        @query= params[:query]
        @articles= Article.where('articles.title LIKE ?',["%#{@query}%"])
    
        render 'index'


    end


    def destroy
       
        @article.destroy
        flash[:notice]="Article was successfully deleted"
<<<<<<< HEAD
        redirect_to articles_path
=======
        redirect_to user_articles_path
>>>>>>> 40b5d358eed49f362d44871baafb3f25321a8c4a
    end

    private
    def set_article
        @article= Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title,:description, :image)
    end
<<<<<<< HEAD
=======
    def require_same_user

        if current_user != @article.user and !current_user.admin?
            
        
        flash[:danger] = "You can only edit or delete your own articles"
        
        redirect_to root_path
        
        end
        
    end 
>>>>>>> 40b5d358eed49f362d44871baafb3f25321a8c4a




end
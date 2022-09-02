class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    before_action :require_same_user, only: [:edit, :update]
    def index
        @articles=Article.all
    end

    def  new
        @article = Article.new
    end

    def create

        @article = Article.new(article_params)
        @article.user= User.find(session[:user_id])
        respond_to do |format|
        if @article.save
            format.html { redirect_to user_article_path(current_user,@article), notice: "Atricle was successfully created." }  
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
                format.html { redirect_to user_article_path(current_user,@article), notice: "Atricle was successfully Updated." }  
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
        redirect_to user_articles_path
    end

    private
    def set_article
        @article= Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title,:description, :image)
    end
    def require_same_user

        if current_user != @article.user and !current_user.admin?
            
        
        flash[:danger] = "You can only edit or delete your own articles"
        
        redirect_to root_path
        
        end
        
    end




end
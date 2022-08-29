class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    def index
        @articles=Article.all
    end

    def  new
        @article = Article.new
    end

    def create

        @article = Article.new(article_params)
        @article.user= User.find(1)
        respond_to do |format|
        if @article.save
            format.html { redirect_to article_path(@article), notice: "Atricle was successfully created." }  
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
                format.html { redirect_to article_path(@article), notice: "Atricle was successfully Updated." }  
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
        redirect_to articles_path
    end

    private
    def set_article
        @article= Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title,:description, :image)
    end




end
class UsersController < ApplicationController
    
   def new
    @user=User.new
   end

   def create
    @user=User.new(user_params)
    respond_to do |format|
        if @user.save
            format.html { redirect_to articles_path, notice: "Welcome to Alphablog #{@user.username}" }  
          else
            format.html { render :new, status: :unprocessable_entity }
          end       
    end


   end
        
   def index
    @users=User.all
   end
   def edit
    @user=User.find(params[:id])
   end

   def update
    @user=User.find(params[:id])
   
        respond_to do |format|
            if @user.update(user_params)
                format.html { redirect_to articles_path, notice: "User was successfully updated." }  
            else
                format.html { render :edit, status: :unprocessable_entity }
            end   
        end

   end

   def show 
    @user=User.find(params[:id])
    @user_articles=@user.articles


   end



   private
   def user_params
       params.require(:user).permit(:id,:username, :email, :password)

   end

        

   



end
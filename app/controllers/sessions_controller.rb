class SessionsController < ApplicationController
<<<<<<< HEAD
    def new
            
    end



    def create
        user = User.find_by(email: params[:session][:email].downcase)

        if user && user.authenticate(params[:session][:password])
        
        session[:user_id] = user.id
        
        flash[:success] = "You have successfully logged in"
        
        redirect_to user_path(user)
        
        else
        
        flash[:danger] = "There was something wrong with your login information"
        

        respond_to do |format|
               format.html { render :new, status: :unprocessable_entity }       
            end 
        
        
        end
    end

    def destroy
        session[:user_id]=nil
        flash[:success]="You have Logged Out"
        redirect_to root_path
    end



end
=======
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id

      flash[:success] = "You have successfully logged in"

      redirect_to user_path(user)
    else
      flash[:danger] = "There was something wrong with your login information"

      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have Logged Out"
    redirect_to root_path
  end
end
>>>>>>> 40b5d358eed49f362d44871baafb3f25321a8c4a

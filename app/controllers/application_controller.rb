class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    

    def logged_in?
<<<<<<< HEAD

        !!current_user
        
    end

    def require_user

=======
        !!current_user
    end

    def require_user
>>>>>>> 40b5d358eed49f362d44871baafb3f25321a8c4a
        if !logged_in?
            respond_to do |format|
                format.html { redirect_to root_path, notice: "You must be Logged In to perform that action" }  
            end     
         end 
<<<<<<< HEAD

=======
>>>>>>> 40b5d358eed49f362d44871baafb3f25321a8c4a
    end
    
end

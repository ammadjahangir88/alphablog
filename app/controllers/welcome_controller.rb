class WelcomeController < ApplicationController


    def home
<<<<<<< HEAD
=======
        redirect_to user_articles_path(current_user) if logged_in?
>>>>>>> 40b5d358eed49f362d44871baafb3f25321a8c4a
    end

    def about

    end


end
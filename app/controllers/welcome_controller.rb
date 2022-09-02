class WelcomeController < ApplicationController


    def home
        redirect_to user_articles_path(current_user) if logged_in?
    end

    def about

    end


end
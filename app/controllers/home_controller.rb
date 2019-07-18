class HomeController < ApplicationController
    def show
        if current_user != nil
            flash[:alert] = 'You must log out before visiting the home page'
            redirect_to '/dashboard'
        end
    end
end

class HomeController < ApplicationController
    def show
        if current_user != nil
            redirect_to '/dashboard'
        end
    end
end

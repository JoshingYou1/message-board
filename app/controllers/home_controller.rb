class HomeController < ApplicationController
    def home
        if current_userl != nil
            redirect_to '/dashboard'
        end
    end
end

class SessionsController < ApplicationController
    def new
        if current_user != nil
            flash[:alert] = "You\'re already logged in #{current_user.first_name}"
            redirect_to dashboard_path
        end
    end

    def create
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
         session[:user_id] = user.id
         flash[:success] = "Successfully logged in as #{user.email}!"
         redirect_to '/dashboard'
        else
         flash[:error] = 'Invalid email or password. Please try again.'
         redirect_to '/login'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = 'Successfully logged out!'
        redirect_to '/'
    end
end

class SessionsController < ApplicationController
    def new
    end

    def create
        print 'hello world'
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
         session[:user_id] = user.id
         flash[:success] = "Successfully logged in as #{user.email}!"
         redirect_to '/dashboard'
        else
         flash.now[:error] = 'Invalid email or password. Please try again.'
         render "new"
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = 'Successfully logged out!'
        redirect_to '/'
    end
end

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @users = User.new
  end

  def create
    user = User.new(user_params)

    user.email.downcase!

    if user.save
      session[:user_id] = user.id
      flash[:success] = 'User successfully created!'
      redirect_to '/users#index'
    else
      flash[:error] = 'Invalid email or password. Please try again.'
      redirect_to '/users/new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end

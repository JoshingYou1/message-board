class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    @user.email.downcase!

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'User successfully created!'
      redirect_to '/dashboard'
    else
      flash.now[:error] = 'Invalid email or password. Please try again.'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end

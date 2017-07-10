class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    puts user_params
    if !User.exists?(email: user_params[:email])
      user = User.new(user_params)
      user.save
      session[:user_id] = user.id
      redirect_to '/users/new'
    else
      redirect_to '/'
    end

  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end

class SessionsController < ApplicationController
  def new
    User.all.each do |user|
      puts user.inspect
    end
  end

  def create
    user = User.authenticate_with_credentials(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/sessions/new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/sessions/new'
  end
end

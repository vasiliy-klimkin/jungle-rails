class SessionsController < ApplicationController
  def new
    User.all.each do |user|
      puts user.inspect
    end
  end

  def create
    user = User.find_by_email(params[:email])
    puts user.inspect
    puts "RIGHT BEFORE THE IF"
    if user && user.authenticate(params[:password])
      puts "IM IN THE IF"
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

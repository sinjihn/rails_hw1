class SessionsController < ApplicationController

  skip_before_filter :require_user, :only => [:new, :create, :login]

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email_address])
    if user
      session[:user_id] = user.id
      redirect_to users_path
    else
      render "new"
    end  
  end
  
  def login
    @user = User.login
  end
  

  def destroy
    #ends the session var
    session[:user_id] = nil
    redirect_to root_url
    flash[:alert] = "You just logged out"
  end

end

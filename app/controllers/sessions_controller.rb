class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to user_path(@user)
    else
      @user = User.new
      render :new
    end
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    @user = @user.try(:authenticate, params[:user][:password])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_session_path
    end
  end

end

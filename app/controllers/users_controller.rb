class UsersController < ApplicationController

  before_action :set_user, only: [:show]

  def welcome
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end

end

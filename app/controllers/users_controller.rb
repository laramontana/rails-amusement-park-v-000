class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]
  before_action :require_login, only: [:show]


  def welcome
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @message = params[:message] if params[:message]
    @message ||= false
  end

  def update


    # when the user is tall enough and has enough tickets, clicking on 'Go on this ride' displays a thank you message
    # when the user is too short, clicking on 'Go on this ride' displays a sorry message
    # when the user doesn't have enough tickets, clicking on 'Go on this ride' displays a sorry message
    # when the user is too short and doesn't have enough tickets, clicking on 'Go on this ride' displays a detailed sorry message
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end

end

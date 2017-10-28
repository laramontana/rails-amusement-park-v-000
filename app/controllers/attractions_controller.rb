class AttractionsController < ApplicationController
  before_action :require_login, only: [:show, :index, :edit, :new]

  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      if @user.admin
        @attractions = @user.attractions
      else
        redirect_to user_path(@user)
      end
    else
      @attractions = Attraction.all
    end
  end

  def show
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      if @user.admin
        @attractions = @user.attractions.find_by(id: params[:id])
        @ride = @attraction.rides.build
      else
        redirect_to user_path(@user)
      end
    else
      @attraction = Attraction.find_by(id: params[:id])
      @ride = @attraction.rides.build
    end
  end

  def new
    @attraction = Attraction.new
  end

  def create
  end

end

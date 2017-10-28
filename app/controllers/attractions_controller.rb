class AttractionsController < ApplicationController
  before_action :require_login, only: [:show, :index, :edit, :new]
  before_action :set_attraction, only: [:show, :edit]


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
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      render :edit
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

  def set_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

end

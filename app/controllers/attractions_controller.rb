class AttractionsController < ApplicationController
  before_action :require_login, only: [:show, :index]

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

end

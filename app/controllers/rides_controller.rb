class RidesController < ApplicationController

  def new
    @ride = Ride.new(ride_params)
    @ride.take_ride
    redirect_to user_path(@ride.user)
  end

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

end

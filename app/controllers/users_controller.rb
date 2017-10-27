class UsersController < ApplicationController

  def welcome
  end

  def new
    @user = User.new
  end

  def create
  end 

end

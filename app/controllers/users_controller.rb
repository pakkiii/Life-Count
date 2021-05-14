class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @lives = @user.lives.order("created_at DESC")
  end
end


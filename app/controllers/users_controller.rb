class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def show
    @user = User.find(params[:id])
    @lives = @user.lives.order("created_at DESC")
  end
end


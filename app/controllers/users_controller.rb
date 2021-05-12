class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @lives = @user.lives
  end
end


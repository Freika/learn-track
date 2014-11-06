class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_activities = @user.activities.last(10)
  end
end

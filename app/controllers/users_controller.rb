class UsersController < ApplicationController
  
  def index
    @all_users = User.all
  end

  def show
    @user = User.find(params[:user_id])
  end
end

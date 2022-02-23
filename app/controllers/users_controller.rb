class UsersController < ApplicationController
  def index
  @all_users = User.all
  end

  def show
  @user_id = request.params['user_id'].to_i
  @user = User.find_by(id: @user_id)
  @user_posts = User.recent_posts(@user_id)
  
  end
end

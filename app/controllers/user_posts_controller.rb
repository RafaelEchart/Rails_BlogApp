class UserPostsController < ApplicationController
  def index
    @user_id = request.params['user_id'].to_i
    @user = User.find_by(id: @user_id)
    @user_posts = Post.where(user_id: @user_id)
  end

  def show
    post_id = request.params['post_id'].to_i
    @user_id = request.params['user_id'].to_i
    @post = Post.find_by(id: post_id)
  end
end

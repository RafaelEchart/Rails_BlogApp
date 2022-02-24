class UserPostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = Post.where(user_id: params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
  end
end

class UserPostsController < ApplicationController
  def index
    @user_id = request.params['user_id'].to_i
    @user = User.find_by(id: @user_id)
    # @user_posts = Post.where(user_id: @user_id)
    @user_posts = Post.joins(:comments).where("comments.user_id = #{@user.id}")
    p @user_posts
  end

  def show; end
end

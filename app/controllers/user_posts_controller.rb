class UserPostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = Post.where(user_id: params[:user_id]).includes(:comments)
  end

  def show
    @user, @post = user_post_helper
  end

  def new
    @user = User.find(params[:user_id])
    
    if !user_signed_in?
      flash[:error] = 'You need to sign in first!'
      redirect_to "/users/#{@user.id}/posts"
    end

    if (current_user != @user) && current_user != nil
      flash[:error] = "You can't post here!"
      redirect_to "/users/#{@user.id}/posts"
    end

    @post = Post.new
  end

  def create
    @current_user = User.find(params[:user_id])
    @post = Post.new(user: current_user, title: params[:post][:title], text: params[:post][:text],
                     comments_counter: 0, likes_counter: 0)

    if @post.save
      flash[:success] = 'Post successfully created'
      redirect_to "/users/#{@current_user.id}/posts/#{@post.id}"

    else

      flash[:error_title] = @post.errors.messages[:title][0]
      flash[:error_comment] = @post.errors.messages[:text][0]
      redirect_to "/users/#{@current_user.id}/posts/new"

    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.destroy
    flash[:success] = "Post successfully deleted"
    redirect_to "/users/#{params[:user_id]}/posts"

  end

  def all_posts
    @posts = Post.all
  end

  private

  def user_post_helper
    user = User.find(params[:user_id])
    post = Post.find(params[:post_id])

    [user, post]
  end
end

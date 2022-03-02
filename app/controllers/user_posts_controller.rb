class UserPostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = @user.posts
  end

  def show
    @user, @post = user_post_helper
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @post = Post.new(user: current_user, title: params[:post][:title], text: params[:post][:text],
                     comments_counter: 0, likes_counter: 0)

    if @post.save
      flash[:success] = 'Post successfully created'
      redirect_to "/users/#{current_user.id}/posts/#{@post.id}"

    else

      flash[:error_title] = @post.errors.messages[:title][0]
      flash[:error_comment] = @post.errors.messages[:text][0]
      redirect_to "/users/#{current_user.id}/posts/new"

    end
  end


  def destroy
    @post.find(params[:id]).destroy

    flash[:success] = 'Post was successfully deleted'
   redirect_to "/users/#{current_user.id}/posts/"
    
  end

  private

  def user_post_helper
    user = User.find(params[:user_id])
    post = Post.find(params[:post_id])

    [user, post]
  end
end

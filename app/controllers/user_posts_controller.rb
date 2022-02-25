class UserPostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = Post.where(user_id: params[:user_id])
  end

  
  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
  end
  
  def new 
   @user = User.find(params[:user_id])
   @post = Post.new
  end


  def create 
    @current_user = User.find(params[:user_id])
    @post = Post.new(user: @current_user, title: params[:post][:title], text: params[:post][:text])
    if @post.save
      flash[:success] = 'Post successfully created'
      redirect_to "/users/#{@current_user.id}/posts/#{@post.id}"
    else
      flash.now[:error] = 'Error: Post could not be created'
      render :new
    end
  end
end

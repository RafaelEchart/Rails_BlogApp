class UserPostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = Post.where(user_id: params[:user_id])
  end

  
  def show

    @user, @post = get_User_Post
   
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

  def createcomment 
    @user, @post = get_User_Post

  end

  def submitcomment
    @user, @post = get_User_Post


    @comment = Comment.create(post_id: @post.id, user_id: @user.id, text: params[:post][:text] );

    if @comment.save
      
      flash[:success] = 'Comment successfully created'
      redirect_to "/users/#{@user.id}/posts/#{@post.id}"
    else
      flash.now[:error] = 'Error: Comment could not be created'
      render :createcomment
    end
  end


  def submitlike 

        @user, @post = get_User_Post

    @like = Like.create(post_id: @post.id, user_id: @user.id);

    if @like.save
      
      flash[:success] = 'Like successfully created'
      redirect_to "/users/#{@user.id}/posts/#{@post.id}"
    else
      flash.now[:error] = 'Error: Like could not be created'
      render :show
    end
  end


  private 

  def get_User_Post 
    user = User.find(params[:user_id])
    post = Post.find(params[:post_id])

    [user, post]
  end
end

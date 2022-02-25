class LikesController < ApplicationController
  def submitlike
    @user, @post = user_post_helper

    @like = Like.create(post_id: @post.id, user_id: @user.id)

    if @like.save

      flash[:success] = 'Like successfully created'
      redirect_to "/users/#{@user.id}/posts/#{@post.id}"
    else
      flash.now[:error] = 'Error: Like could not be created'
      render :show
    end
  end

  private

  def user_post_helper
    user = User.find(params[:user_id])
    post = Post.find(params[:post_id])

    [user, post]
  end

end

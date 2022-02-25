class CommentsController < ApplicationController
  def createcomment
    @user, @post = user_post_helper
  end

  def submitcomment
    @user, @post = user_post_helper

    @comment = Comment.create(post_id: @post.id, user_id: @user.id, text: params[:post][:text])

    if @comment.save

      flash[:success] = 'Comment successfully created'
      redirect_to "/users/#{@user.id}/posts/#{@post.id}"
    else
      flash.now[:error] = 'Error: Comment could not be created'
      render :createcomment
    end
  end

  private

  def user_post_helper
    user = User.find(params[:user_id])
    post = Post.find(params[:post_id])

    [user, post]
  end
end

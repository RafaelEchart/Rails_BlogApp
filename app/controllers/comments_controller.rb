class CommentsController < ApplicationController
  def createcomment

    if !user_signed_in?
      flash[:notice] = 'You need to log in first!'
      redirect_to "/users/#{params[:user_id]}/posts/#{params[:post_id]}"
    end
    
    @post = Post.find(params[:post_id])
    @user = current_user
  end

  def submitcomment
    @post = Post.find(params[:post_id])
    @user = current_user

    @comment = Comment.create(post_id: @post.id, user_id: @user.id, text: params[:post][:text])

    if @comment.save

      flash[:success] = 'Comment successfully created'
    else
      flash[:error] = 'Error: Comment could not be created'
    end
    redirect_to "/users/#{@user.id}/posts/#{@post.id}"
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    flash[:sucess] = 'You deleted the comment 💬'
    redirect_to "/users/#{params[:user_id]}/posts/#{params[:post_id]}"
  end

  

 
end

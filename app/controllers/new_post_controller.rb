class NewPostController < ApplicationController
  def index
  end

  def new
    new_post = Posts.new

    respond_to do |format|
      format.html { render :new, locals: { new_post: new_post } }
    end
  end

end

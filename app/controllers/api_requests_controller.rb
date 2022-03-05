class ApiRequestsController < ApplicationController
    def all_posts
     render :json => Post.all
    end

    def post_comments
        render :json => Comment.where(post_id: params[:post_id])
    end
    
 end
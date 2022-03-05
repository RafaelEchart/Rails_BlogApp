class ApiRequestsController < ApplicationController
    def all_posts
     render :json => Post.all
    end
 end
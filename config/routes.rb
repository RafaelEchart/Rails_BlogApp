# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  
  get '/users', to: 'users#index'
  get '/users/:user_id', to: 'users#show'
  
  get '/users/:user_id/posts', to: 'user_posts#index'
  get '/users/:user_id/posts/new', to: 'user_posts#new'
  get '/users/:user_id/posts/:post_id', to: 'user_posts#show'
  get '/users/:user_id/posts/:post_id/new_comment', to: 'comments#createcomment'

  
  post '/users/:user_id/posts', to: 'user_posts#create'
  post '/users/:user_id/posts/:post_id/new_comment', to: 'comments#submitcomment'
  post '/users/:user_id/posts/:post_id/new_like', to: 'likes#submitlike'


  delete '/posts/:user_id/posts/:post_id', to: 'user_posts#destroy', as: 'user_post_delete'
  delete '/users/:user_id/posts/:post_id/comments/:comment_id', to: 'comments#destroy', as: 'user_comment_delete'
  

    # API ROUTES

    get '/api/posts', to: 'api_requests#all_posts'
    get '/api/posts/:post_id/comments', to: 'api_requests#post_comments'
    post '/api/posts/comment', to: 'api_requests#new_comments'
end

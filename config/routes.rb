# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'
  
  get '/users', to: 'users#index'
  get '/users/:user_id', to: 'users#show'
  
  get '/users/:user_id/posts', to: 'user_posts#index'
  get '/users/:user_id/posts/new', to: 'user_posts#new'
  get '/users/:user_id/posts/:post_id', to: 'user_posts#show'
  get '/users/:user_id/posts/:post_id/new_comment', to: 'user_posts#createcomment'

  
  post '/users/:user_id/posts', to: 'user_posts#create'
  post '/users/:user_id/posts/:post_id/new_comment', to: 'user_posts#submitcomment'
end

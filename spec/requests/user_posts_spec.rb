require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Posts' do

  describe 'Users pages visited', type: :feature do
    it 'Main post of user(By ID) page is visited' do
      visit '/users/:123/posts'
      expect(page).to have_text('This page will display all the post of the user (by ID)')
    end

    it 'A single post(By ID) of a user(By ID) is visited' do
      visit '/users/:123/posts/:123'
      expect(page).to have_text('This page will show information about a post(By ID) from a user(By ID)')
    end
  end

  describe 'get posts#show', type: :request do
    before(:each) { get '/users/:123/posts/:123' }
    it "renders 'show' in posts controller" do
      expect(response).to render_template('show')
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'get posts#index', type: :request do
    before(:each) { get '/users/:123/posts' }
    it "renders 'index' in posts controller" do
      expect(response).to render_template('index')
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
  end



end
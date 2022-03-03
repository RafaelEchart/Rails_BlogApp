require 'rails_helper'
require 'capybara/rspec'

describe 'User profile page', type: :feature do
    before :each do
      @user = User.create(name: 'Rafael', bio: "This is my life",photo: "https://avatars.githubusercontent.com/u/53021807?v=4", email: 'rafael@test.com', password: '123456')
      @post1 = Post.create(user_id: @user.id, title: 'First Blog Post', text: 'This is a test 1' )
      post2 = Post.create(user_id: @user.id, title: 'Second Blog Post', text: 'This is a test 2' )
      post3 = Post.create(user_id: @user.id, title: 'Third Blog Post', text: 'This is a test 3' )
    end

    it 'I can see the users profile picture' do
        visit "users/#{@user.id}"
        expect(page).to have_css("img[src*='https://avatars.githubusercontent.com/u/53021807?v=4']")  
    end

    it 'I can see the users username' do
        visit "users/#{@user.id}"
        expect(page).to have_content('@Rafael')
    end

    it 'I can see the number of posts the user has written.' do
        visit "users/#{@user.id}"
        expect(page).to have_selector(:id, 'profile_user_counter', text: '3')
    end

    it 'I can see the users bio.' do
        visit "users/#{@user.id}"
        expect(page).to have_content('This is my life')
    end

    it 'I can see the users first 3 posts.' do
        visit "users/#{@user.id}"
        expect(@user.recent_posts.length).to eq(3)
    end
    
    it 'I can see a button that lets me view all of a users posts.' do
        visit "users/#{@user.id}"
        expect(page).to have_button('See all posts')
    end
   
    it 'When I click a users post, it redirects me to that posts show page.' do
        visit "users/#{@user.id}"
        click_link("post_#{@post1.id}")
        expect(current_path).to eq("/users/#{@user.id}/posts/#{@post1.id}")
    end
    
    it 'When I click to see all posts, it redirects me to the users posts index page.' do
        visit "users/#{@user.id}"
        click_link("See all posts")
        expect(current_path).to eq("/users/#{@user.id}/posts")
    end



   
    
  
end
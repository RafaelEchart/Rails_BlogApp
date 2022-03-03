require 'rails_helper'
require 'capybara/rspec'

describe 'User profile page', type: :feature do
    before :each do
      @user = User.create(name: 'Rafael', bio: "This is my life", photo: "https://avatars.githubusercontent.com/u/53021807?v=4", email: 'rafael@test.com', password: '123456')
      @post1 = Post.create(user_id: @user.id, title: 'First Blog Post', text: 'This is a test 1, this is a very large post so you will have to enter to read it all' )
      Comment.create(post_id: @post1.id, user_id: @user.id, text: 'Comment 1' );
      Comment.create(post_id: @post1.id, user_id: @user.id, text: 'Comment 2' );
      Comment.create(post_id: @post1.id, user_id: @user.id, text: 'Comment 3' );
      Comment.create(post_id: @post1.id, user_id: @user.id, text: 'Comment 4' );
      Comment.create(post_id: @post1.id, user_id: @user.id, text: 'Comment 5' );
      Comment.create(post_id: @post1.id, user_id: @user.id, text: 'Comment 6' );
      Comment.create(post_id: @post1.id, user_id: @user.id, text: 'Comment 7' );
    end

    it 'I can see the users profile picture' do
        visit "users/#{@user.id}/posts"
        expect(page).to have_css("img[src*='https://avatars.githubusercontent.com/u/53021807?v=4']")  
    end

    it 'I can see the users username' do
        visit "users/#{@user.id}/posts"
        expect(page).to have_content('@Rafael')
    end

    it 'I can see the number of posts the user has written.' do
        visit "users/#{@user.id}/posts"
        expect(page).to have_selector(:id, 'profile_user_counter', text: '1')
    end


    it 'I can see a posts title.' do
        visit "users/#{@user.id}/posts"
        expect(page).to have_content('First Blog Post')
    end
  
    it 'I can see some of the posts body.' do
        visit "users/#{@user.id}/posts"
        expect(page).to have_content('This is a test 1, this is a very')
    end

    it 'I can see the first comments on a post.' do
        visit "users/#{@user.id}/posts"
        expect(@post1.recent_comments.length).to eq(5)
    end
    
    it 'I can see how many comments a post has.' do
        visit "users/#{@user.id}/posts"
        expect(page).to have_content('Comments: 7')
    end
    
    it 'I can see how many likes a post has.' do
        visit "users/#{@user.id}/posts"
        expect(page).to have_content('Likes: 0')
    end
    
    it 'I can see the date when the user sign up' do
        visit "users/#{@user.id}/posts"
        expect(page).to have_content("Joined: #{@user.created_at.strftime("%B %d, %Y")}")
    end
   
    
    it 'When I click on a post, it redirects me to that posts show page.' do
        visit "users/#{@user.id}/posts"
        click_link("post_#{@post1.id}")
        expect(current_path).to eq("/users/#{@user.id}/posts/#{@post1.id}")
    end
end
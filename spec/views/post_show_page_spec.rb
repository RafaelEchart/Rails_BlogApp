require 'rails_helper'
require 'capybara/rspec'

describe 'Post show page', type: :feature do
  before :each do
    @user = User.create(name: 'Rafael', bio: 'This is my life',
                        photo: 'https://avatars.githubusercontent.com/u/53021807?v=4',
                        email: 'rafael@test.com', password: '123456')

    @user2 = User.create(name: 'LeonardoSaltos', bio: 'This is my life',
                         photo: 'https://avatars.githubusercontent.com/u/53021807?v=4',
                         email: 'rafael@test.com', password: '123456')

    @post1 = Post.create(user_id: @user.id, title: 'First Blog Post',
                         text: 'This is a test 1, this is a very large post so you will have to enter to read it all')

    Comment.create(post_id: @post1.id, user_id: @user.id, text: 'Comment 1')
    Comment.create(post_id: @post1.id, user_id: @user.id, text: 'Comment 2')
    Comment.create(post_id: @post1.id, user_id: @user.id, text: 'Comment 3')
  end

  it 'I can see a posts title.' do
    visit "users/#{@user.id}/posts/#{@post1.id}"
    expect(page).to have_content('First Blog Post')
  end

  it 'I can see the who wrote the post' do
    visit "users/#{@user.id}/posts/#{@post1.id}"
    expect(page).to have_content('Rafael')
  end

  it 'I can see how many comments the post has.' do
    visit "users/#{@user.id}/posts/#{@post1.id}"
    expect(page).to have_content('Comments: 3')
  end

  it 'I can see how many likes the post has.' do
    visit "users/#{@user.id}/posts/#{@post1.id}"
    expect(page).to have_content('Likes: 0')
  end

  it 'I can see the post body.' do
    visit "users/#{@user.id}/posts/#{@post1.id}"
    expect(page).to have_content('This is a test 1, this is a very large post so you will have to enter to read it all')
  end

  it 'I can see the username of each commentor' do
    visit "users/#{@user.id}/posts/#{@post1.id}"
    expect(page).to have_content("Username: #{@user.name}")
  end

  it 'I can see the comment each commentor left.' do
    visit "users/#{@user.id}/posts/#{@post1.id}"
    expect(page).to have_content('Comment: Comment 1')
    expect(page).to have_content('Comment: Comment 2')
    expect(page).to have_content('Comment: Comment 3')
  end
end

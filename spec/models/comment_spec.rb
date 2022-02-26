require 'rails_helper'

RSpec.describe Like, type: :model do
  let (:user) { User.create!(name: 'Rafael', photo: 'google.com', bio: 'FrontEnd Developer', post_counter: 0) }
  let (:post) { Post.create!(user: user, title: 'Testing', text: 'Content', comments_counter: 0, likes_counter: 0) }

  it 'Update like_counter when like is posted' do
    post.likes.create(user: user)
    expect(post.likes_counter).to be(1)
  end


end
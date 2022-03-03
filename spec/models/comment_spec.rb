require_relative '../rails_helper'

RSpec.describe Like, type: :model do
  let(:user) do
    User.create(name: 'Rafael', bio: 'This is my life',
                photo: 'https://avatars.githubusercontent.com/u/53021807?v=4',
                email: 'rafael@test.com', password: '123456')
  end

  let(:post) { Post.create!(user:, title: 'Testing', text: 'Content', comments_counter: 0, likes_counter: 0) }

  it 'Update like_counter when like is posted' do
    post.likes.create(user:)
    expect(post.likes_counter).to be(1)
  end
end

require_relative '../rails_helper'

RSpec.describe Like, type: :model do
  describe '#update_counter' do
    let(:user) do
      User.create(name: 'Rafael', bio: 'This is my life',
                  photo: 'https://avatars.githubusercontent.com/u/53021807?v=4',
                  email: 'rafael@test.com', password: '123456')
    end
    let(:post) do
      Post.create!(title: 'Post', user_id: user.id, text: 'Some text', comments_counter: 0, likes_counter: 1)
    end

    it 'updates the likes counter' do
      post.likes.create(user:)
      expect(post.likes_counter).to eq 1
    end
  end
end

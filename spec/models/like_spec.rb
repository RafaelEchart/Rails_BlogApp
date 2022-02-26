require_relative '../rails_helper'

RSpec.describe Like, type: :model do
  describe '#update_counter' do
    let(:user) { User.create!(name: 'Paulina', photo: 'MB', bio: 'bio', post_counter: 3) }
    let(:post) do
      Post.create!(title: 'Post', user_id: user.id, text: 'Some text', comments_counter: 0, likes_counter: 1)
    end

    it 'updates the likes counter' do
      post.likes.create(user:)
      expect(post.likes_counter).to eq 1
    end
  end
end

require_relative '../rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(name: 'Rafael', bio: 'This is my life',
                photo: 'https://avatars.githubusercontent.com/u/53021807?v=4',
                email: 'rafael@test.com', password: '123456')
  end

  before { subject.save }

  it 'Name should not be nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'post_counter should be integer higher or equal to 0' do
    subject.post_counter = nil
    expect(subject).to_not be_valid
  end

  it 'Adding 4 posts and recent_post method should return only 3' do
    subject.posts.create!(title: 'test1', text: 'post1-text-test', comments_counter: 0, likes_counter: 0)
    subject.posts.create!(title: 'test2', text: 'post2-text-test', comments_counter: 0, likes_counter: 0)
    subject.posts.create!(title: 'test3', text: 'post3-text-test', comments_counter: 0, likes_counter: 0)
    subject.posts.create!(title: 'test4', text: 'post4-text-test', comments_counter: 0, likes_counter: 0)
    expect(subject.recent_posts.length).to be(3)
  end
end

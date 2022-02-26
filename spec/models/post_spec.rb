require_relative '../rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create!(name: 'Rafael', photo: 'goolgle.com', bio: 'DOM artist!', post_counter: 0) }
  subject do
    Post.create!(user:, title: 'Testing', text: 'Content', comments_counter: 0, likes_counter: 0)
  end

  before { subject.save }

  it 'Name should not be nil' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be integer higher or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be integer higher or equal to 0' do
    subject.comments_counter = nil
    expect(subject).to_not be_valid
  end

  it 'Adding 7 comments and recent_comments method should return only 5' do
    subject.comments.create!(post: subject, user:, text: 'test_comment-12345')
    subject.comments.create!(post: subject, user:, text: 'test_comment-12345')
    subject.comments.create!(post: subject, user:, text: 'test_comment-12345')
    subject.comments.create!(post: subject, user:, text: 'test_comment-12345')
    subject.comments.create!(post: subject, user:, text: 'test_comment-12345')
    subject.comments.create!(post: subject, user:, text: 'test_comment-12345')
    subject.comments.create!(post: subject, user:, text: 'test_comment-12345')
    expect(subject.recent_comments.length).to be(5)
  end
end

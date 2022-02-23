class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  after_save :update_posts_counter

  def self.recent_comments(post_id)
    Comment.where(post_id:).order(created_at: :desc).take(4)
  end

  private

  def update_posts_counter
    user.update(post_counter: user.posts.length)
  end
end

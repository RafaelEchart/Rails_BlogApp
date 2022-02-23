class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  def self.recent_posts(user_id)
    Post.where(user_id:).order(created_at: :desc).take(3)
  end
end

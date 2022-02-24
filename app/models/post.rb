class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  after_save :update_posts_counter

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    user.update(post_counter: user.posts.length)
  end
end

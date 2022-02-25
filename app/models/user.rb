class User < ApplicationRecord
  
  validates :name, presence: { message: 'Name must not be blank' }
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0, message: 'Post counter should be greater or equal to 0' }

  
  
  has_many :posts
  has_many :likes
  has_many :comments

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end

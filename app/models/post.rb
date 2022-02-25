class Post < ApplicationRecord

  validates :title, presence: { message: 'This field can not be blank' }, length: { maximum: 250, message: 'Post title should not exceed 250 characters' }
  validates :text, presence: { message: 'This field can not be blank' }, length: { maximum: 250, message: 'Post title should not exceed 250 characters' }
  validates :comments_counter, numericality: { message: 'The input should be greater or equal to 0', only_integer: true, greater_than_or_equal_to: 0, }
  validates :likes_counter, numericality: { message: 'The input should be greater or equal to 0', only_integer: true, greater_than_or_equal_to: 0, }



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

class Comment < ApplicationRecord
  validates :text, presence: { message: 'Comment must not be blank!' }

  belongs_to :user
  belongs_to :post

  after_save :update_comments_counter

  private

  def update_comments_counter
    post.update(comments_counter: post.comments.length)
  end
end

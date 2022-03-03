class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: { message: 'Name must not be blank' }
  validates :post_counter,
            numericality: { only_integer: true, greater_than_or_equal_to: 0,
                            message: 'Post counter should be greater or equal to 0' }

  def is?(requested_role)
    role == requested_role.to_s
  end

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end

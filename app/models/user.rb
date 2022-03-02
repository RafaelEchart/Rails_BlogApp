class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: { message: 'Name must not be blank' }
  validates :post_counter,
            numericality: { only_integer: true, greater_than_or_equal_to: 0,
                            message: 'Post counter should be greater or equal to 0' }

  has_many :posts
  has_many :likes
  has_many :comments

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def admin?
    role == 'admin'
  end

  def is?(requested_role)
    role == requested_role.to_s
  end
  
end

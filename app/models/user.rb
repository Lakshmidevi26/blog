class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts,dependent: :destroy
  has_many :comments,dependent: :destroy

  has_many :user_comment_ratings
  has_many :comments,through: :user_comment_ratings

  has_and_belongs_to_many :posts, join_table: "posts_users_read_status"

end

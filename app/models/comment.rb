class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true
  # Post.find_each { |u| User.reset_counters(u.id, :comments) }

  belongs_to :user

  has_many :user_comment_ratings
  has_many :users,through: :user_comment_ratings
  
end

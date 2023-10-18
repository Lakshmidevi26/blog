class Rating < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_create :update_rating_average

  def update_rating_average
    post = Post.find(post_id)
    post.update(rating_average:post.ratings.average(:star))
    puts post.ratings.average(:star)
  end  
end

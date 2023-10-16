class UserCommentRatingsController < ApplicationController

before_action :set_comment, only: %i[create] 

def create
   @rate = UserCommentRating.find_by(comment_id:params[:comment_id],user_id:current_user.id)
   unless @rate.nil?
       @rate.update(rating:params[:user_comment_rating][:rating])
   else
       @comment.user_comment_ratings.create(user_id:current_user.id,rating:params[:user_comment_rating][:rating])
    end 

    redirect_to topic_post_url(topic_id:params[:topic_id],id:params[:post_id])
end    

private

def set_comment
    @comment = Comment.find(params[:comment_id])
end    

end
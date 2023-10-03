class RatingsController < ApplicationController

    def create
        if Rating.find_by(user_id: current_user.id,post_id: params[:post_id] )
             if Rating.where(user_id: current_user.id,post_id: params[:post_id]).update(star: params[:rating][:star])
                redirect_to '/posts',notice: "success 1" 
             else
                redirect_to '/posts',notice: "fail"   
             end   
        else  
            if Rating.create(post_id: params[:post_id],star: params[:rating][:star],user_id: current_user.id)
                redirect_to '/posts',notice: "success 2" 
            else
                redirect_to '/posts',notice: "fail"                  
            end    
        end
    end    
end
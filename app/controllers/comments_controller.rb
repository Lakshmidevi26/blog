class CommentsController < ApplicationController
  before_action :set_topic
  before_action :set_post
  before_action :set_comment ,only: %i[show edit update destroy]
  
  def index
    @comments=@post.comments.all
  end

  def new
    @comment=@post.comments.build
  end

  def show
  end

  def create
    @comment=@post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to topic_post_url(@topic,@post)
    else
      render :new
    end

  end

  def update
    if @comment.update(comment_params)
      redirect_to topic_post_url(@topic,@post)
    else
      render :edit
    end
  end

  def destroy
     @comment.destroy!
     redirect_to topic_post_url(@topic,@post)
  end


  private

  def set_topic
    @topic =Topic.find(params[:topic_id])
  end
  
  def set_post
    @post=Post.find(params[:post_id])
  end

  def set_comment
    @comment=Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text,:post_id)
  end

end
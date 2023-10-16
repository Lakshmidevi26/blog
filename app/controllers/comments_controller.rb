class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment ,only: %i[show edit update destroy]

  def index
    @comments=@post.comments.all
  end

  def new
    @comment=@post.comments.build
  end

  def show
    @comment=@comment.commentsratings.all
  end

  def create
    comment=@post.comments.new(comment_params)
    comment.user_id=current_user.id
    if comment.save
      redirect_to '/posts'
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to '/posts'
    else
      render :edit
    end
  end

  def destroy
     @comment.destroy!
     redirect_to '/posts'
  end


  private

  def set_post
    @post=Post.find(params[:post_id])
  end
  def comment_params
    params.require(:comment).permit(:text,:post_id)
  end

  def set_comment
    @comment=Comment.find(params[:id])
  end
end
class PostsController < ApplicationController
  before_action :find,only:%i[show edit update destroy]
  before_action :new_instance,only:%i[new]
  def index
    @posts=Post.all
  end

  def update
    if @post.update(post_params)
      redirect_to '/posts'
    else
      render :edit
    end
  end
  def create
    post = Post.new(post_params)
    if post.save
      redirect_to '/posts'
    else
      render :new
    end
  end

  def destroy
    if @post.delete
      redirect_to '/posts'
    else
      render :edit
    end
  end

  def show_under_topic
    @posts=Post.where(topic_id: params[:topic_id])
  end

  private
  def find
    @post=Post.find(params[:id])
  end

  def new_instance
    @post=Post.new
  end

  def post_params
    params.require(:post).permit(:title,:description,:topic_id)
  end
end
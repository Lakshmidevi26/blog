class PostsController < ApplicationController
  before_action :set_topic
  before_action :set_post,only:%i[show edit update destroy]
  def index
    #@posts=@topic.Post.all
    if params[:topic_id].nil?
      @posts=Post.all
    else
      @posts=@topic.posts.all
    end
  end

  def new
    @post=@topic.posts.build
  end
  def update
    create_or_delete_posts_tags(@post,params[:post][:tags])

    if @post.update(post_params.except(:tags))
      redirect_to '/topics'
    else
      render :edit
    end
  end
  def create
    post = @topic.posts.new(post_params.except(:tags))
    post.save
    create_or_delete_posts_tags(post,params[:post][:tags])

    if post.save
      redirect_to '/topics'
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

  def show_on_topic_id
    if params[:topic_id].nil?
    @posts=Post.all
    else
    @posts=Post.where(topic_id: params[:topic_id])
    end
  end

  private

  def create_or_delete_posts_tags(post,tags)
    #tags=tags.strip.split(',')
    unless tags.nil?
    tags.each do |tag|
      if !(Tag.find_by(name: tag))
      post.tags << Tag.create(name: tag)
      elsif !(post.tags.find_by(name: tag))
        post.tags << Tag.find_by(name: tag)
      end
    end  
    end
  end  

  def set_post
    @post=Post.find(params[:id])
  end

  def set_topic
    unless params[:topic_id].nil?
    @topic=Topic.find(params[:topic_id])
    end
  end

  def post_params
    params.require(:post).permit(:title,:description,:topic_id,tags_attributes:[:name,:id])
  end
end
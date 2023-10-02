class PostsController < ApplicationController

  load_and_authorize_resource

  before_action :set_topic
  before_action :set_post,only:%i[show edit update destroy]
  def index
    #@posts=@topic.Post.all
    if params[:topic_id].nil?
      @posts=Post.all.page(params[:page])
    else
      @posts=@topic.posts.all.page(params[:page])
    end
  end

  def new
    @post=@topic.posts.build
    @tag=@post.tags.build
  end
  def update
    create_posts_tags(@post,params[:post][:tags])

    unless params[:post][:star].nil?
    add_rating(@post,params[:post][:star])
    end

   # @post.image.attach(params[:image])

    if @post.update(post_params)
      topic=Topic.find(@post.topic_id)
      redirect_to topic_post_path(topic.id,@post)
    else
      render :edit
    end
  end

  def edit
    @tag=@post.tags.build
  end  


  def create
    post = @topic.posts.new(post_params)
    post.user_id = current_user.id
    post.save
    create_posts_tags(post,params[:post][:tags])
   #post.image.attach(params[:image])
    if post.save
      redirect_to '/topics'
    else
      render :new
    end
  end

  def destroy
    @post.tags.clear
    @post.ratings.clear
    if @post.delete
      redirect_to '/posts'
    else
      render :edit
    end
  end


  private

  def create_posts_tags(post,tags)
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


  def add_rating(post,value)
    
      Rating.create(post_id: post.id,star: value)

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
    params.require(:post).permit(:title,:description,:image,:topic_id,tags_attributes:[:name,:id],ratings_attributes:[:post_id,:star])
  end
end
class PostsController < ApplicationController
  load_and_authorize_resource
  protect_from_forgery with: :null_session

  before_action :set_topic
  before_action :set_post,only:%i[show edit update destroy]
  before_action :set_comment, only:%i[ show ]
  protect_from_forgery except: :index

  skip_after_action :verify_same_origin_request
  
  def index

   
    if params[:topic_id].nil?
      from = params[:from].nil? ? Date.yesterday(): params[:from]
      to = params[:to].nil? ? Date.today(): params[:to]
  
      @posts=Post.listed(from,to).includes(:topic).page(params[:page])  
    else 
      @posts=@topic.posts.all.page(params[:page]) 
    end

  end

  def new
    @post=@topic.posts.build
    @tag=@post.tags.build
  end

  def update
    unless params[:post][:star].nil?
        add_rating(@post,params[:post][:star])
    end
    @url = topic_post_url(@topic, @post)
   
   respond_to do |format|
    if @post.update(post_params)
      format.html { redirect_to topic_post_url(@topic, @post), notice: "post was successfully updated." }
      format.json { render :show, status: :ok, location: @post }
      format.js {  render js: "window.location='#{@url.to_s}'" }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @post.errors, status: :unprocessable_entity }
    end
  end

  end

  def edit
    @post.tags.build
  end  

 def show
  @post=Post.find(params[:id])

 end 

  def create
    @post = @topic.posts.new(post_params)
    @post.user_id = current_user.id
    # create_posts_tags(@post,params[:post][:tags])

    respond_to do |format|
      if @post.save
        format.html { redirect_to topic_post_url(@topic, @post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
        format.js { render layout: false }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js { render layout: false}
      end
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

  def read
    post = Post.find(params[:post_id])
    if post.users.where(id: params[:user_id]).count==0
      user = User.find(params[:user_id])
      post.users << user
    end  
  end  

  def status
   
      # @_current_user ||= session[:current_user_id] &&
      #   User.find_by(id: session[:current_user_id])
    #   user = User.find(id: session[:current_user_id])
    #  puts session
    post = Post.find(params[:post_id])
    if post.users.where(id: params[:user_id]).count==0
      user = User.find(params[:user_id])
      post.users << user
    end  
  end  


  private

  def add_rating(post,value)
      if Rating.find_by(user_id: current_user.id)
      Rating.find_by(user_id: current_user.id).update(star: value)
      else  
      Rating.create(post_id: post.id,star: value,user_id: current_user.id)
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

  def set_comment
    @comments = @post.comments.all
    @comment = Comment.new
  end  

  def post_params
    params.require(:post).permit(:title,:from,:to,:description,:image,:topic_id,tag_ids: [],tags_attributes: [:id, :name, :_destroy],ratings_attributes: [:post_id,:star])
  end
end
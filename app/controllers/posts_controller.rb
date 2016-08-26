class PostsController < ApplicationController
	before_action :find_post, except: [:index, :new, :create]
  before_action :authenticate_user!
  
  def index
  	redirect_to root_path
  	#@posts = post.where(user_id: current_user.id)
  end

  def show
    commontator_thread_show(@commontable)
  end

  def new
  	@post = current_user.posts.new
  end

  def create
  	@post = current_user.posts.new(post_params)
  	if @post.save
  		redirect_to post_path(@post)
  	else
  		render :new
    end
  end

  def edit
  end

  def update
  	if @post.update(post_params)
  		redirect_to post_path(@post)
  	else
  		render :edit
    end
  end

  def destroy
  	@post.destroy
  	redirect_to posts_path
  end

  private

  def post_params
  	params.require(:post).permit(:title, :content, :user_id)
  end

  def find_post
  	@post = current_user.posts.find(params[:id])
  end

end

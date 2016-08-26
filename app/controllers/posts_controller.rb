class PostsController < ApplicationController
  before_action :authenticate_user!, except: :show
	before_action :find_post, except: [:index, :new, :create]
  def index
  	# posts = Post.where(user_id:current_user.id)
  	@posts = Post.all
  end

  def show
    #commontator_thread_show(post)
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
  	@post = Post.find(params[:id])
  end

end

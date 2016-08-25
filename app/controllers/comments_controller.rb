class CommentsController < ApplicationController
  
 

  def index
  	@comments = @post.comment
  end

  def show
  	@comment = @post.comment.find(params[:id])
  end
 
 	def new
  	@comment = Comment.new
  end


  def edit
  	@comment = @blogger.post.comment
  end

  def update
  	if @comment.update(comment_params)
  		redirect_to blogger_post_path(@blogger, @post)
  	else
  		render :edit
  	end
	end

	def destroy 
		@comment.destroy
		redirect_to post_comment_path(@comment)
	end

	private

	def comment_params
		params.require(:comment).permit(:opinion, :user_id, :post_id)
	end

	def blogger 
		@blogger = Bloger.find(params [:blogger_id])
	end

	def post 
		@po
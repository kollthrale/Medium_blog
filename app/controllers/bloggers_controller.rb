class BloggersController < ApplicationController

  def show
		@blogger = User.find(params[:id])
		@posts = @blogger.posts(params[:user_id])
  end

  private

  def post_params
    params.require(:blogger).permit(:user_id)
  end
end

class HomeController < ApplicationController
	def index
			# @user = User.find(params[:user_id])

			@posts = Post.all.paginate(page: params[:page], per_page: 5).order(created_at: :desc)
  end
end

class BloggersController < ApplicationController

  def show
		@blogger = current_user.posts(current_user.id)
		@posts = current_user.posts
  end
end

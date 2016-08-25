class BloggersController < ApplicationController
		before_action :find_blogger, except: [:index, :new, :create]
  before_action :authenticate_user!
  
  def index
  	@bloggers = blogger.where(user_id: current_user.id)
  end

  def show
  end

  private

  def blogger_params
  	params.require(:blogger).permit(:name, :goal, :user_id)
  end

  def find_blogger
  	@blogger = current_user.bloggers.find(params[:id])
  end

end

class BloggersController < ApplicationController
	before_action :find_blogger, except: [:index, :new, :create]


  def index
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

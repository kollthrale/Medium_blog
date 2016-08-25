class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
	commontator_thread_show(@commontable)
  def after_sign_in_path_for(resource)
  	blogger_path(current_user)
  end

end

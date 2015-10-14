class Admin::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout "admin"

  before_filter :authorize

  def current_moderator
    @current_moderator ||= Moderator.find(session[:moderator_id]) if session[:moderator_id]
  end
  # helper_method :current_moderator

  def authorize
  	unless current_moderator
    	redirect_to '/login', alert: 'Please login to view admin pages'
  	end
  end
end

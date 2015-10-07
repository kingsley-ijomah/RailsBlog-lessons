class Admin::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authorize

  def current_moderator
    @current_moderator ||= Moderator.find(session[:moderator_id]) if session[:moderator_id]
  end
  helper_method :current_moderator

  def authorize
    redirect_to '/login' unless current_moderator
  end
end

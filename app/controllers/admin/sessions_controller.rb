class Admin::SessionsController < Admin::ApplicationController
	before_action :authorize, except: [:new, :create]
	
  def new
  end

  def create
  	@moderator = Moderator.find_by(username: params[:username]).authenticate(params[:password])
  	session[:current_moderator_id] = @moderator.id
  end

  def destroy
  end
end

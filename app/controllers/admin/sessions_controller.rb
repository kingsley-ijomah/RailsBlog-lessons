class Admin::SessionsController < Admin::ApplicationController

  before_filter :authorize, except: [:new, :create]

  layout "login"

  def new
  end

  def create
  	moderator = Moderator.find_by username: params[:username]
    if moderator && moderator.authenticate(params[:password])
      session[:moderator_id] = moderator.id

      flash[:notice] = "You successfully logged in"
      redirect_to admin_dashboard_index_url
    else
      flash[:alert] = "There was a problem with your credentials"
      render :new
    end
  end

  def destroy
    session[:moderator_id] = nil

    flash[:notice] = "You successfully logged out"
    redirect_to '/login'
  end
end

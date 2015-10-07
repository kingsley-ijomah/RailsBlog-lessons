class Admin::SessionsController < Admin::ApplicationController
  def new
  end

  def create
  	moderator = Moderator.find_by username: params[:username]
    if moderator && moderator.authenticate(params[:password])
      session[:moderator_id] = moderator.id
      redirect_to admin_dashboard_index_url
    else
      render :new
    end
  end

  def destroy
  end
end

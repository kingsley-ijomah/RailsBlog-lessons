class Admin::NotificationsController < Admin::ApplicationController
  def index
  	@visitor_notifications = Notification.where(:notifiable_type => 'Visitor')
  	@comment_notifications = Notification.where(:notifiable_type => 'Comment')
  end

  def destroy
  	@notification = Notification.find(params[:id])
  	@notification.destroy

    flash[:notice] = "Notification dismissed successfully"
  	redirect_to :back
  end

  def delete_all
  	Notification.delete_all
  	flash[:notice] = "All notifications dismissed successfully"

  	redirect_to :back
  end
end

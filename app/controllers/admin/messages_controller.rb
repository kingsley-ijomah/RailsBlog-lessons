class Admin::MessagesController < Admin::ApplicationController
  def index
  	@messages = Message.all.order(id: :desc).page params[:page]
  end

  def show
  	@message = Message.find(params[:id])
  	if @message.status == false
  		@message.update(status: true)
  	end
  end

  def update
  	@message = Message.find(params[:id])
  	@message.update(status: params[:status])

    flash[:notice] = "Message updated successfully"
  	redirect_to :back
  end

  def destroy
  	@message = Message.find(params[:id])
  	@message.destroy

    flash[:notice] = "Message deleted successfully"
  	redirect_to admin_messages_url
  end
end

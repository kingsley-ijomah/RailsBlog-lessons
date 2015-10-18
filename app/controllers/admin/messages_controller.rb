class Admin::MessagesController < Admin::ApplicationController
  def index
    if params[:search].present? && !params[:search].nil?
      @messages = Message.joins(:visitor).where(
        "content like ? OR fullname like ?", "%#{params[:search]}%", "%#{params[:search]}%").page params[:page]
    else
      @messages = Message.all.order(id: :desc).page params[:page]
    end
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

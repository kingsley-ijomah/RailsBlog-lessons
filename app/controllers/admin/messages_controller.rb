class Admin::MessagesController < Admin::ApplicationController
  def index
  	@messages = Message.all.order(id: :desc).page params[:page]
  end

  def show
  end

  def update
  end

  def destroy
  	@message = Message.find(params[:id])
  	@message.destroy

  	redirect_to :back, notice: 'Message was successfully deleted'
  end
end

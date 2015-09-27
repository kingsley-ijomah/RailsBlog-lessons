class Admin::MessagesController < ApplicationController
  def index
  	@messages = Message.all
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

  	redirect_to :back
  end

  def destroy
  	@message = Message.find(params[:id])
  	@message.destroy

  	redirect_to admin_messages_url
  end
end

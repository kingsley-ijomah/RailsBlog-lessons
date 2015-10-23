class MessagesController < ApplicationController
  def new
  	@visitor = Visitor.build_empty_message
  end

  def create
  	@visitor = Visitor.find_or_build_message(visitor_params)

  	if @visitor.save
  		flash[:notice] = "Message submitted successfully"
  		redirect_to contact_url
  	else
  		flash[:alert] = "There was a problem submitting your message"
  		render 'new'
  	end
  end

  private

  def visitor_params
		params.require(:visitor).permit(:id, :fullname, :email, :messages_attributes => [:content])
	end
end

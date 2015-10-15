class Admin::MessageSearchController < Admin::ApplicationController
  def index
  	if params[:search].present? && !params[:search].nil?
			@messages = Message.where("content like ?", "%#{params[:search]}%").page params[:page]
		else
			@messages = []
		end
  end
end
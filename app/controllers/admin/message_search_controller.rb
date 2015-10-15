class Admin::MessageSearchController < Admin::ApplicationController
  def index
  	if params[:search].present? && !params[:search].nil?
			@messages = Message.joins(:visitor).where("content like ? OR fullname like ?", "%#{params[:search]}%", "%#{params[:search]}%").page params[:page]
		else
			@messages = []
		end
  end
end
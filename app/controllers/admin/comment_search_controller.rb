class Admin::CommentSearchController < Admin::ApplicationController
  def index
  	if params[:search].present? && !params[:search].nil?
			@comments = Comment.joins(:visitor).where(
				"message like ? OR fullname like ?", "%#{params[:search]}%", "%#{params[:search]}%").page params[:page]
		else
			@comments = []
		end
  end
end

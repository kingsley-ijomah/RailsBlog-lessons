class Admin::CommentSearchController < Admin::ApplicationController
  def index
  	if params[:search].present? && !params[:search].nil?
			@comments = Comment.where("message like ?", "%#{params[:search]}%").page params[:page]
		else
			@comments = []
		end
  end
end

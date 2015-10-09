class Admin::CommentSearchController < Admin::ApplicationController
  def index
  	if params[:search].present? && !params[:search].nil?
			@comments = Comment.where("message like ?", "%#{params[:search]}%") 
		else
			@comments = []
		end
  end
end

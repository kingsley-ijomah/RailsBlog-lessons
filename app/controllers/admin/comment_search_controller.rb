class Admin::CommentSearchController < ApplicationController
  def index
  	if params[:search].present? && !params[:search].nil?
			@comments = Comment.where("message like ?", "%#{params[:search]}%") 
		else
			@comments = []
		end
  end
end

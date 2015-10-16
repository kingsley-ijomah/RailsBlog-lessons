class Admin::PostSearchController < Admin::ApplicationController
	def index
		if params[:search].present? && !params[:search].nil?
			@posts = Post.where(
				"title like ? OR content like ?", "%#{params[:search]}%", "%#{params[:search]}%").page params[:page]
		else
			@posts = []
		end
	end
end
class Admin::PostSearchController < ApplicationController
	def index
		if params[:search].present? && !params[:search].nil?
			@posts = Post.where("title like ?", "%#{params[:search]}%") 
		else
			@posts = []
		end
	end
end
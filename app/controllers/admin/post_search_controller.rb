class Admin::PostSearchController < ApplicationController
	def index
		if params[:search]
			@posts = Post.where("title like ?", "%#{params[:search]}%") 
		else
			@posts = []
		end
	end
end
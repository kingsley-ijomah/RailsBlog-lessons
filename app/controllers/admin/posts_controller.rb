class Admin::PostsController < ApplicationController
	def new
		@post = Post.new
	end
end

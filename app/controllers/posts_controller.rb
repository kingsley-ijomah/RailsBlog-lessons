class PostsController < ApplicationController
  def index
  	if params[:tag]
  		@posts = Post.filter_by_tag params[:tag], params[:page]
  	else
  		@posts = Post.get_published params[:page]
  	end
  end

  def show
  end

  private

	def set_post
		@post = Post.find(params[:id])
	end
end

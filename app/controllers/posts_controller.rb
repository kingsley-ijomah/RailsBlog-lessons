class PostsController < ApplicationController
  def index
  	if params[:tag]
  		@posts = Post.filter_by_tag(params[:tag]).page(params[:page]).per(Setting.post_per_page)
  	else
  		@posts = Post.get_published.page(params[:page]).per(Setting.post_per_page)  
  	end
  end

  def show
  end

  private

	def set_post
		@post = Post.find(params[:id])
	end
end

class PostsController < ApplicationController

  include VisitorCommentable

  def index
  	if params[:tag]
  		@posts = Post.filter_by_tag(params[:tag]).page(params[:page]).per(Setting.post_per_page)
  	else
  		@posts = Post.get_published.page(params[:page]).per(Setting.post_per_page)  
  	end
  end

  def show
    @post = Post.find(params[:id])

    @visitor = build_visitor_comment

    respond_to do |format|
      format.html
    end

    delete_sessions [:visitor_errors, :visitor_attr, :comments_attr]
  end
end

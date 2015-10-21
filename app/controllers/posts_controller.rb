class PostsController < ApplicationController
  def index
  	if params[:tag]
  		@posts = Post.filter_by_tag(params[:tag]).page(params[:page]).per(Setting.post_per_page)
  	else
  		@posts = Post.get_published.page(params[:page]).per(Setting.post_per_page)  
  	end
  end

  def show
    @post = Post.find(params[:id])
    # first render view with session
    # delete session after render
    respond_to do |format|
      format.html
    end
    session.delete(:visitor_errors) if session[:visitor_errors]
    session.delete(:comment_errors) if session[:comment_errors]
  end
end

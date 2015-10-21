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
    
    # prepopulate form
    @visitor = Visitor.new(session[:visitor]) if session[:visitor]
    # first render view with session
    # delete session after render
    respond_to do |format|
      format.html
    end
    session.delete(:visitor) if session[:visitor]
  end
end

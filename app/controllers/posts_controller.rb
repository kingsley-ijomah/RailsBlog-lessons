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

    if session[:visitor_attr] && session[:comments_attr]
      @visitor = Visitor.build_comment(session[:visitor_attr], session[:comments_attr])
    else
      @visitor = Visitor.build_empty_comment
    end

    respond_to do |format|
      format.html
    end

    session.delete(:visitor_errors) if session[:visitor_errors]
    session.delete(:visitor_attr) if session[:visitor_attr]
    session.delete(:comments_attr) if session[:comments_attr]
  end
end

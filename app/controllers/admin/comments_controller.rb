class Admin::CommentsController < ApplicationController
  def index
  	if params[:approved] == 'true'
  		@comments = Comment.where(status: true)
  	elsif params[:approved] == 'false'
  		@comments = Comment.where(status: false)
  	else
  		@comments = []
  	end
  end

  def update
  	@comment = Comment.find(params[:id])
  	@comment.update_attribute('status', params[:status])

  	redirect_to :back
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy

  	redirect_to admin_comments_url
  end
end
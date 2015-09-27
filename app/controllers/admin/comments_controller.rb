class Admin::CommentsController < ApplicationController
  def index
  	if params[:approved] == 'true'
  		@comments = Comment.where(status: true)
  	elsif params[:approved] == 'false'
  		@comments = Comment.where(status: false)
  	else
  		@comments = Comment.all
  	end
  end

  def update
  end

  def destroy
  end
end

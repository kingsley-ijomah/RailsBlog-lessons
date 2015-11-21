class Admin::CommentsController < Admin::ApplicationController
  def index
  	@comments = Comment.where(status: to_bool(params[:status]))
  end

  def update
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy

  	redirect_to :back, notice: 'Successfully deleted comment'
  end
end

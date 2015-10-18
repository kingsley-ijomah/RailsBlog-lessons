class Admin::CommentsController < Admin::ApplicationController
  def index
    if params[:search].present? && !params[:search].nil?
      @comments = Comment.matching_message_or_fullname(params[:search]).page params[:page]
    else
      @comments = Comment.filter_by_approved(params[:approved]).page params[:page]
    end
  end

  def update
  	@comment = Comment.find(params[:id])
  	@comment.update(status: params[:status])

    flash[:notice] = "Comment updated successfully"
  	redirect_to :back
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy

    flash[:notice] = "Comment deleted successfully"
  	redirect_to :back
  end
end

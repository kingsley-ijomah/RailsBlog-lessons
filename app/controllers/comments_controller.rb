class CommentsController < ApplicationController
  def new
  end

  def create
  	byebug
  end

  private

  def comment_params
		params.require(:comment).permit(:message, :post_id, visitor: [:fullname, :email])
	end
end

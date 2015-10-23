class CommentsController < ApplicationController
  def create
  	@visitor = Visitor.find_or_build_comment(visitor_params)

  	if @visitor.save
  		flash[:notice] = "Comment submitted successfully"
  	else
  		flash[:alert] = "There was a problem submitting your comment"
  		session[:visitor_attr] = visitor_params
  		session[:comments_attr] = visitor_params[:comments_attributes]["0"]
  		session[:visitor_errors] = @visitor.errors.full_messages if @visitor.errors.any?
  	end

  	redirect_to :back
  end

  private

  def visitor_params
		params.require(:visitor).permit(:id, :fullname, :email, :comments_attributes => [:message, :post_id])
	end
end

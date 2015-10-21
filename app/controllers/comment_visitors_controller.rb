class CommentVisitorsController < ApplicationController
	# not necessary
	def new
	end

  def create
  	@visitor = Visitor.build_visitor_comment(visitor_params)
  	
  	if @visitor.save
  		flash[:notice] = "Comment submitted successfully"
  	else
  		flash[:alert] = "There was a problem submitting your comment"
  		session[:visitor_errors] = @visitor.errors if @visitor.errors.any?
  		session[:comment_errors] = @visitor.comments.last.errors if @visitor.comments.last.errors.any?
  	end

  	redirect_to :back
  end

  private

  def visitor_params
		params.require(:visitor).permit(:id, :fullname, :email, :comments => [:message, :post_id])
	end
end

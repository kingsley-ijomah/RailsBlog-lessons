class CommentVisitorsController < ApplicationController
	# not necessary
	def new
	end

  def create
  	# @visitor = Visitor.build_visitor_comment(visitor_params)
  	
  	@visitor = Visitor.find_by(email: visitor_params[:email])
  	if @visitor
  		visitor_params[:comments_attributes].each_value{|c| @visitor.comments << Comment.new(c)}
  		@visitor
  	else
  		@visitor = Visitor.new(visitor_params)
  	end

  	if @visitor.save
  		flash[:notice] = "Comment submitted successfully"
  	else
  		flash[:alert] = "There was a problem submitting your comment"
  		session[:visitor_errors] = @visitor.errors.full_messages if @visitor.errors.any?
  	end

  	redirect_to :back
  end

  private

  def visitor_params
		params.require(:visitor).permit(:id, :fullname, :email, :comments_attributes => [:message, :post_id])
	end
end

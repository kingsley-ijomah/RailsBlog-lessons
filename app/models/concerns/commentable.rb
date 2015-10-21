module Commentable
	extend ActiveSupport::Concern

	module ClassMethods
		def build_visitor_comment(visitor_params)
			visitor_params = visitor_params
	  	comments_params = visitor_params.delete(:comments)

	  	visitor = build_visitor(visitor_params, comments_params)
	  end

	  def find_or_initialize visitor_params
	  	visitor = Visitor.find_or_initialize_by(email: visitor_params[:email]) do |v|
				v.fullname = visitor_params[:fullname]
			end
	  end

	  def initialize_visitor_with_comment(visitor_params, comments_params)
	  	visitor = find_or_initialize(visitor_params).tap do |v|
				v.comments << Comment.new(comments_params)
			end
	  end

	  def build_visitor visitor_params, comments_params
	  	if visitor_params[:email].empty?
	  		Visitor.new(visitor_params).tap do |v|
	  			v.comments << Comment.new(comments_params)
	  		end
	  	else
	  		initialize_visitor_with_comment(visitor_params, comments_params)
			end
	  end
	end

	module InstanceMethods
		# ...
	end
end
module Messageable
	extend ActiveSupport::Concern

	module ClassMethods
		def find_or_build_comment params
			visitor = Visitor.find_by(email: params[:email])

			if visitor
	  		visitor.comments << Comment.new(params[:comments_attributes]["0"])
	  		visitor
	  	else
	  		Visitor.new(params)
	  	end
		end

	  def build_empty_comment
	  	Visitor.new(comments: [Comment.new()])
	  end

	  def build_comment visitor_attr, comments_attr
	  	Visitor.new(visitor_attr).tap do |v|
	      v.comments = [Comment.new(comments_attr)]
	    end
	  end
	end

	module InstanceMethods
		#..
	end
end
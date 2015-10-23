module Messageable
	extend ActiveSupport::Concern

	module ClassMethods
		def find_or_build_message params
			visitor = Visitor.find_by(email: params[:email])

			if visitor
	  		visitor.messages << Message.new(params[:messages_attributes]["0"])
	  		visitor
	  	else
	  		Visitor.new(params)
	  	end
		end

	  def build_empty_message
	  	Visitor.new(messages: [Message.new()])
	  end
	end

	module InstanceMethods
		#..
	end
end
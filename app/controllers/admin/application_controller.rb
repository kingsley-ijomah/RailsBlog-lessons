class Admin::ApplicationController < ApplicationController
	before_action :authorize
	
	def current_moderator
		false
	end

	def authorize
		unless current_moderator
			redirect_to '/login', alert: 'Please login to view admin pages'
		end
	end
end
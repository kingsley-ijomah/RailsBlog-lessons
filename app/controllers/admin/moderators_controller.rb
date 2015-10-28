class Admin::ModeratorsController < ApplicationController
	def index
		@moderators = Moderator.all
	end
end
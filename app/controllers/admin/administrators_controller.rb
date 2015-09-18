class Admin::AdministratorsController < ApplicationController
	#Get /admin/administrators/new
	def new
		@administrator = Administrator.new
	end
end

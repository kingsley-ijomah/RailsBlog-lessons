class Admin::AdministratorsController < ApplicationController
	# GET /admin/adminsitrators/
	def index
		@administrators = Administrator.all
	end

	# Get /admin/administrators/new
	def new
		@administrator = Administrator.new
	end

	# Post /admin/administrators/create
	def create
		@administrator = Administrator.new(admin_params)

		if @administrator.save
			redirect_to admin_administrators_url
		else
			render 'new'
		end
	end

	# GET /admin/administrator/:id/edit
	def edit
		@administrator = Administrator.find(params[:id])
	end

	# Delete /admin/administrator
	def destroy
		@administrator = Administrator.find(params[:id])
		@admin.delete

		redirect_to admin_administrators_url
	end

	private

	def admin_params
		params.require(:administrator).permit(:id, :fullname, :username, :password)
	end
end
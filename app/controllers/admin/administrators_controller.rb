class Admin::AdministratorsController < ApplicationController
	before_action :set_admin, only: [:show, :edit, :update, :destroy]

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

	# GET /admin/administrator/:id
	def show
	end

	# GET /admin/administrator/:id/edit
	def edit
	end

	# POST /admin/administrator
	def update

		if @administrator.update(admin_params)
			redirect_to admin_administrators_url
		else
			render 'edit'
		end
	end

	# Delete /admin/administrator
	def destroy
		@administrator.delete

		redirect_to admin_administrators_url
	end

	private

	def set_admin
		@administrator = Administrator.find(params[:id])
	end

	def admin_params
		params.require(:administrator).permit(:id, :fullname, :username, :password)
	end
end
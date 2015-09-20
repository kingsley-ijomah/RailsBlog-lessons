class Admin::AdministratorsController < ApplicationController
	before_action :set_admin, only: [:show, :edit, :update, :destroy]

	def index
		@administrators = Administrator.all
	end

	def new
		@administrator = Administrator.new
	end

	def create
		@administrator = Administrator.new(admin_params)

		if @administrator.save
			redirect_to admin_administrators_url
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update

		if @administrator.update(admin_params)
			redirect_to admin_administrators_url
		else
			render 'edit'
		end
	end

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
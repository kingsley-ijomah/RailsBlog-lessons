class Admin::ModeratorsController < ApplicationController
	before_action :set_admin, only: [:edit, :update, :destroy]

	def index
		@moderators = Moderator.all
	end

	def new
		@moderator = Moderator.new
	end

	def create
		@moderator = Moderator.new(admin_params)

		if @moderator.save
			redirect_to admin_moderators_url
		else
			render 'new'
		end
	end

	def edit
	end

	def update

		if @moderator.update(admin_params)
			redirect_to admin_moderators_url
		else
			render 'edit'
		end
	end

	def destroy
		@moderator.destroy

		redirect_to admin_moderators_url
	end

	private

	def set_admin
		@moderator = Moderator.find(params[:id])
	end

	def admin_params
		params.require(:moderator).permit(:id, :fullname, :username, :password)
	end
end
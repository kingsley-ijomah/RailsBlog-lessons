class Admin::ModeratorsController < Admin::ApplicationController

	before_action :set_admin, only: [:edit, :update]

	def index
		@moderators = Moderator.all.order(id: :desc).page params[:page]
	end

	def edit
	end

	def update

		if @moderator.update(admin_params)
			flash[:notice] = "Moderator updated successfully"
			redirect_to admin_moderators_url
		else
			flash[:alert] = "There was a problem updating Moderator"
			render 'edit'
		end
	end

	private

	def set_admin
		@moderator = Moderator.find(params[:id])
	end

	def admin_params
		params.require(:moderator).permit(:id, :fullname, :username, :password)
	end
end
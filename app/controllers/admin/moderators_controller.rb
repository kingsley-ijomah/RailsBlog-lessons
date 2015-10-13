class Admin::ModeratorsController < Admin::ApplicationController

	before_action :set_admin, only: [:edit, :update, :destroy]

	def index
		@moderators = Moderator.all.order(id: :desc).page params[:page]
	end

	def new
		if current_moderator.is_global?
			@moderator = Moderator.new
		else
			flash[:notice] = "You are not authorised to create moderators"
			redirect_to admin_moderators_url
		end
	end

	def create
		@moderator = Moderator.new(admin_params)

		if @moderator.save
			flash[:notice] = "Moderator created successfully"
			redirect_to admin_moderators_url
		else
			flash[:alert] = "There was a problem creating Moderator"
			render 'new'
		end
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

	def destroy
		if @moderator.is_logged_in?(current_moderator)
			flash[:notice] = "Cannot delete a moderator currently logged in"
		else
			@moderator.destroy
			flash[:notice] = "Moderator deleted successfully"
		end
		redirect_to :back
	end

	private

	def set_admin
		@moderator = Moderator.find(params[:id])
	end

	def admin_params
		params.require(:moderator).permit(:id, :fullname, :username, :password)
	end
end
class Admin::TagsController < Admin::ApplicationController
	before_action :set_tag, only: [:show, :edit, :update, :destroy]

	def new
		@tag = Tag.new
		@tags = Tag.all.order(id: :desc).page params[:page]
	end

	def create
		tag_params[:name].split(",").map do |tag|
			Tag.new(name:tag).save
		end
		flash[:notice] = "Tags created successfully"
		redirect_to new_admin_tag_url
	end

	def show
	end

	def edit
	end

	def update

		if @tag.update(tag_params)
			flash[:notice] = "Tag updated successfully"
			redirect_to new_admin_tag_url
		else
			flash[:alert] = "There was a problem creating Tag"
			render 'edit'
		end
	end

	def destroy
		@tag.destroy

		flash[:notice] = "Tag deleted successfully"
		redirect_to new_admin_tag_url
	end

	private

	def set_tag
		@tag = Tag.find(params[:id])
	end

	def tag_params
		params.require(:tag).permit(:id, :name, :status)
	end
end

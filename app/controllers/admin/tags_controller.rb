class Admin::TagsController < ApplicationController
	before_action :set_tag, only: [:show, :edit, :update, :destroy]

	def new
		@tag = Tag.new
		@tags = Tag.all
	end

	def create
		tag_params[:name].split(",").map do |tag|
			Tag.new(name:tag).save
		end

		redirect_to new_admin_tag_url
	end

	def show
	end

	def edit
	end

	def update

		if @tag.update(tag_params)
			redirect_to new_admin_tag_url
		else
			render 'edit'
		end
	end

	def destroy
		@tag.delete

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

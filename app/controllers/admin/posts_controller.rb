class Admin::PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to admin_posts_url
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update

		if @post.update(post_params)
			redirect_to admin_posts_url
		else
			render 'edit'
		end
	end

	def destroy
		@post.delete

		redirect_to admin_posts_url
	end

	private

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:id, :title, :content, :publish, :administrator_id)
	end
end

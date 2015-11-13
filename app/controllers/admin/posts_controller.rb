class Admin::PostsController < Admin::ApplicationController
  def index
    @posts = Post.all.order(id: :desc).page params[:page]
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
end

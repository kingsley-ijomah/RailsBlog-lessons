class Admin::SettingsController < Admin::ApplicationController
  def new
  	@setting = Setting.new
  end

  def create
  end

  def edit
  end

  def update
  end

  private
  def settings_params
  	params.require(:setting).permit(:id, :site_name, :post_per_page, :under_maintenance, :prevent_commenting,
  		:tag_visibility)
  end
end

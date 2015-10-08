class Admin::SettingsController < Admin::ApplicationController
  before_action :set_model, only: [:edit, :update, :destroy]

  def new
    if Setting.exists?
      @setting = Setting.first
      redirect_to edit_admin_setting_url(@setting)
    else
      @setting = Setting.new
    end
  end

  def create
    @setting = Setting.new(settings_params)

    if @setting.save
      redirect_to edit_admin_setting_url(@setting)
    else
      render 'new'
    end
  end

  def edit
    # set_model
  end

  def update
    if @setting.update(settings_params)
      redirect_to edit_admin_setting_url(@setting)
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def set_model
    @setting = Setting.find(params[:id])
  end

  def settings_params
    params.require(:setting).permit(:id, :site_name, :post_per_page, :under_maintenance, :prevent_commenting, :tag_visibility)
  end
end

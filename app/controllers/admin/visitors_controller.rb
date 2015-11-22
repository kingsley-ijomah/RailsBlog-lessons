class Admin::VisitorsController < Admin::ApplicationController
  def index
  	@visitors = Visitor.all.order(id: :desc).page params[:page]
  end

  def destroy
  	@visitor = Visitor.find(params[:id])
  	@visitor.destroy

  	redirect_to :back, notice: 'Successfully deleted visitor'
  end
end

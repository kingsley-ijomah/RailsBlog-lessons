class Admin::VisitorsController < Admin::ApplicationController
  def index
  	@visitors = Visitor.all.order(id: :desc).page params[:page]
  end

  def destroy
  	@visitor = Visitor.find(params[:id])
  	@visitor.destroy

  	flash[:notice] = "Visitor deleted successfully"
  	redirect_to :back
  end
end

class Admin::VisitorsController < ApplicationController
  def index
  	@visitors = Visitor.all
  end

  def destroy
  	@visitor = Visitor.find(params[:id])
  	@visitor.destroy

  	redirect_to :back
  end
end

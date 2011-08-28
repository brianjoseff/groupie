class MembershipsController < ApplicationController
  def index
  end

  def update
  end
  
  def destroy
    @membership = Membership.find(params[:id])
    if @membership.destroy
      redirect_to @membership.group
      flash[:success] = "member removed"
    end
  end
end

class MembershipsController < ApplicationController
  def index
  end

  def update
  end
  
  #create a membership
  def create
    @group = Group.where(:group_id => params[:id])
    @user = current_user
    if current_user.join!(@group)                                 
      #run ajax that switches 'join' button to 'leave' button
      redirect_to @user
    else
      #error message or something
      redirect_to @group
    end
  end
  
  def destroy
    @membership = Membership.find_by_member_id_and_group_id(params[:member_id], params[:group_id])
    @membership.destroy
  end
end

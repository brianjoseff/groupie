class MembershipsController < ApplicationController
  def index
  end

  def update
  end
  
  #create a membership
  def create
    @membership = Membership.create({:group_id=>params[:group_id], 
                                     :member_id=>current_user.id})
    @group = Group.where(:group_id => params[:id])
                                     
    if @membership.save
      #run ajax that switches 'join' button to 'leave' button
      redirect_to :root
    else
      #error message or something
      render :root
    end
  end
  
  def destroy
    @membership = Membership.find_by_member_id_and_group_id(params[:member_id], params[:group_id])
    @membership.destroy
  end
end

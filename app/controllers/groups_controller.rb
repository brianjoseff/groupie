class GroupsController < ApplicationController
	before_filter :get_group, :except => [:index, :create, :new]
	def show
		@title = @group.name
		@posts = @group.posts.paginate(:per_page => 5, :page => params[:page])
		#@posts = Post.paginate(:page => params[:page], :per_page => 15, :conditions =>		['group_id = ? ' , @group.id ])
		@memberships = Membership.find_all_by_group_id(@group)
	end
	
	def index
		@title = "Groups"
		if params[:user_id]
			@user = User.find(params[:user_id])
			@groups = @user.groups_as_owner
		else 
			@q = Post.search(params[:q])
			@posts = @q.result
			@q = Group.search(params[:q])
			@groups = @q.result
		end
	end
	
	def edit
		@user = @group.owner
		unless current_user == @user
			redirect_to current_user, :flash => {:notice => "Sorry, you can only view your own stuff"}
		end
	end
	
	#this is updating the password field when users type it in. you need to figure out how
	#to just check their input against what code is on record for the group
	# use 'update_attribute()' or make a new controller action
	def update
		params[:group][:member_ids] = (params[:group][:member_ids] << @group.member_ids).flatten
		#special method update_attribute only updates explicitly stated attribute
		if @group.update_attributes(params[:group])
			redirect_to @group
			flash[:success] = "group updated"
		end
	end
	
	def new
		@group = Group.new
		@group.post_images.build
		@categories = GroupCategory.all
	end
	
	def create
		@categories = GroupCategory.all
		@group = current_user.groups_as_owner.build(params[:group])
			params[:group][:member_ids] = (params[:group][:member_ids] << @group.member_ids).flatten 
		if @group.save
			redirect_to @group
			flash[:success] = "Invite users by pasting emails into the field below"
		else
			redirect_to user_show(current_user)
		end
	end
	
	def destroy
		@group.destroy
	end
	
	# GET /groups/search
	def search
	@groups = Group.search params[:q]

	render :action => "index"
	end
	
	def private
		#@group = find_by_id(params[:id])
		group = Group.check(params[:code], params[:id])
		
		if group.nil?
			flash[:error] = "you need the secret password to join this group" 
			redirect_to @group		
		else
			 params[:group][:member_ids] = (params[:group][:member_ids] << @group.member_ids).flatten
			 if @group.update_attributes(:member_ids => params[:group][:member_ids])
				 redirect_to @group
				 flash[:success] = "group updated"
			 end
		end
		
	end
		
	
	private
	def get_group
		@group = Group.find(params[:id])
		
	end
end

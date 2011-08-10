class PostsController < ApplicationController
  before_filter :get_post_and_user, :except => [:index]
  # GET /posts
  # GET /posts.xml
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @posts = @user.posts
    else
      @posts = Post.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @user = User.find(current_user.id)
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.build
    @assigment = Assignment.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    
  end

  # POST /posts
  # POST /posts.xml
  def create
    @user = User.find(params[:user_id])
    params[:post][:group_ids] ||= []
    @post = @user.posts.build(params[:post])
    @groups = current_user.groups
    @post.user_id = current_user.id
    
    #for each group that is 'assigned' create an assignment object
    
    # group_ids = params[:post][:groups]
    #     groups.each do |x|
    #       @assignment = Assignment.new({:post_id=>params[:id], 
    #                                        :group_id=>x.id})
    #     end
    
    # if groups.assigned?
    #    @user.groups_as_owner.each do |x|
    #     for group in groups
    #    @assignment = Assignment.new({:post_id=>params[:id], 
    #                                     :group_id=>x.id})
    #    end
    #  end
    #end
    
    if @post.save
      redirect_to @post
    else
      redirect_to user_show(current_user)
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    params[:post][:group_ids] ||= []
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
  private
  def get_post_and_user
    @user = User.find(params[:user_id]) if params[:user_id]
    @post = Post.find(params[:id])
  end
end

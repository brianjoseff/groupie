class PostsController < ApplicationController
  #before_filter :get_post_and_user, :except => [:index, :new]
  # GET /posts
  # GET /posts.xml
  def search
    @search = Post.search do
      fulltext params[:search]
    end
    @posts = @search.results
  end
  
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @posts = @user.posts
    else
#       @q = Post.search(params[:q])
#       @posts = @q.result
#       @q = Group.search(params[:q])
#       @groups = @q.result
#      redirect_to search_path
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])
    @owner = User.find(@post.user_id)
    @email = @post.emails.build
        
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end
  
#  def email
#    @post = Post.find(params[:id])
#    @owner = User.find(@post.user_id)
#    respond_to do |format|
#      format.html # show.html.erb
#      format.xml  { render :xml => @post }
#    end
#  end
  
#  def send
#    @post = Post.find(params[:id])
#    @owner = User.find(@post.user_id)
#    @subject = params[:subject]
#    @content = params[:content]
#    InterestMailer.interest_email(@owner,@post.name,@subject,@content)
#    respond_to do |format|
#      format.html # show.html.erb
#      format.xml  { render :xml => @post }
#    end
#  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @user = User.find(params[:user_id])
   #  @post = @user.posts.build
   @post = Post.new
#     @assigment = Assignment.new
    #allow up to 5 images to be uploaded
    #5.times {@post.build_post_image}
#     post_image = @post.post_images.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    @post_images = @post.post_images
  end

  # POST /posts
  # POST /posts.xml
  def create
    @user = current_user
#     params[:post][:group_ids] ||= []
    @post = @user.posts.build(params[:post])
    
    if @post.save
      redirect_to @user
    else
      redirect_to new_user_post_path(current_user), :notice => "NOOOOOOOOOOOOO"
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
    @post = Post.find(params[:post][:id])
  end
end

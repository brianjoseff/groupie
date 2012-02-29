class GroupCategoriesController < ApplicationController
  # GET /group_categories
  # GET /group_categories.json
  def index
    @group_categories = GroupCategory.all


  end

  # GET /group_categories/1
  # GET /group_categories/1.json
  def show
    @group_category = GroupCategory.find(params[:id])
    #@groups = Group.paginate(:page => params[:page], :per_page => 10, :conditions =>   ['group_category_id = ? ' , @group_category.id ])
    @groups = @group_category.groups
  end

  # GET /group_categories/new
  # GET /group_categories/new.json
  def new
    @group_category = GroupCategory.new

  end

  # GET /group_categories/1/edit
  def edit
    @group_category = GroupCategory.find(params[:id])
  end

  # POST /group_categories
  # POST /group_categories.json
  def create
    @group_category = GroupCategory.new(params[:group_category])

    respond_to do |format|
      if @group_category.save
        format.html { redirect_to @group_category, :notice => 'Group category was successfully created.' }
        format.json { render :json => @group_category, :status => :created, :location => @group_category }
      else
        format.html { render :action => "new" }
        format.json { render :json => @group_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /group_categories/1
  # PUT /group_categories/1.json
  def update
    @group_category = GroupCategory.find(params[:id])

    respond_to do |format|
      if @group_category.update_attributes(params[:group_category])
        format.html { redirect_to @group_category, :notice => 'Group category was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @group_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /group_categories/1
  # DELETE /group_categories/1.json
  def destroy
    @group_category = GroupCategory.find(params[:id])
    @group_category.destroy

    respond_to do |format|
      format.html { redirect_to group_categories_url }
      format.json { head :ok }
    end
  end
end

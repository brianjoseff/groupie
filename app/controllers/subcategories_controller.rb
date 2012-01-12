class SubcategoriesController < ApplicationController  
  def index
    @subcategories = Subcategory.find(:all) 
  end

  def new
    @subcategory = Subcategory.new
  end

  def edit
    @subcategory = Subcategory.find(params[:id])
  end

  def create
    @subcategory = Subcategory.new(params[:subcategory])

    if @subcategory.save
      flash[:notice] = 'Subcategory was successfully created.'
      redirect_to(subcategories_path) 
    else
      render :action => "new"
    end
  end

  def update
    @subcategory = Subcategory.find_by_permalink(params[:id])

    if @subcategory.update_attributes(params[:subcategory])
      flash[:notice] = 'Subcategory was successfully updated.'
      redirect_to(subcategories_path) 
    else
      render :action => "edit"        
    end
  end

  def destroy
    @subcategory = Subcategory.find_by_permalink(params[:id])
    @subcategory.destroy

    redirect_to(subcategories_url)
  end
end

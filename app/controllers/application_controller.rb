class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery
  
  before_filter :require_login, :get_categories, :get_search_object
  
  private
  def require_login
    unless signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_url
    end
  end
  
  def get_search_object
    @q = Post.search(params[:q])
    @posts = @q.result
    @q = Group.search(params[:q])
    @groups = @q.result
  end
  
  def get_categories
    @categories = ProductCategory.all
  end
  
  def get_product_categories
    @forsale = ProductCategory.find_by_id(1)
    @wanted = ProductCategory.find_by_id(2)
    @jobs = ProductCategory.find_by_id(3)
    @free = ProductCategory.find_by_id(4)
    @housing = ProductCategory.find_by_id(5)
  end
end

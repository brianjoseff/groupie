class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery
  
  before_filter :require_login, :get_product_categories
  
  private
  def require_login
    unless signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_url
    end
  end
  
  def get_product_categories
    @forsale = ProductCategory.find_by_id(1)
    @wanted = ProductCategory.find_by_id(2)
    @jobs = ProductCategory.find_by_id(3)
    @free = ProductCategory.find_by_id(4)
    @housing = ProductCategory.find_by_id(5)
  end
end

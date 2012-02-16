class ApplicationController < ActionController::Base
  include Clearance::Authentication
  protect_from_forgery
  
  before_filter :require_login, :get_categories, :get_search_object
  def require_login
    deny_access unless signed_in?
  end
  
  def deny_access
    store_location
    redirect_to root_url, :notice => "gotta sign in or sign up brah"
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end
  private
    def store_location
      session[:return_to] = request.fullpath
    end

    def clear_return_to
      session[:return_to] = nil
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

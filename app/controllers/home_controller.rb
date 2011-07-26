class HomeController < ApplicationController
  skip_before_filter :require_login
  def index
  end
  def home
    
  end
  
  def about
  end
  
  def contact
  end
end

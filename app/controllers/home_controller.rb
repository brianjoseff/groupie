class HomeController < ApplicationController
  skip_before_filter :require_login
  def index
    if current_user
      @user = current_user
    end
  end
  
  def home
    if current_user.id == nil
      @user = User.new
    else
      @user = current_user
    end
  end
  
  def about
  end
  
  def contact
  end
end

class RootController < ApplicationController
  def index
    if signed_in?
      path = current_user
    else
      path = 'home#index'
    end
    redirect_to path
  end
end
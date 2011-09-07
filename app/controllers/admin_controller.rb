class AdminController < ApplicationController
  before_filter :authorize_as_admin
  private
  def authorize_as_admin
    unless current_user.admin?
      deny_access(flash_message = "You don't have access to admin")
    end
  end
end
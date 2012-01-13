module SessionsHelper
  def deny_access
    store_location
    if signed_in?
      redirect_to current_user, :notice => "sorry, can't go there."
    else
      redirect_to root, :notice => "gotta sign in brah"
    end
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
end

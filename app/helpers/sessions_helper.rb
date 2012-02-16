module SessionsHelper
  def require_login
    deny_access unless signed_in?
  end
  
  def deny_access
    store_location
    redirect_to root, :notice => "gotta sign in or sign up brah"
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

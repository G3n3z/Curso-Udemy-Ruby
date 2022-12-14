module SessionsHelper
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    puts("User #{current_user}")
    puts("#{!!current_user}")
    !!current_user
  end
end

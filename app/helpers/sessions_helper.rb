module SessionsHelper
  def signed_in_user
    session[:user_id]
  end
end

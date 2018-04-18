module SessionsHelper
  def signed_in_user
    session[:user_id]
  end

  def sign_in(user)
    session[:user_id] = user.id
  end
end

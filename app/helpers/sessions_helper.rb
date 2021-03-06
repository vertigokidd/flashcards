helpers do
  # This will return the current user, if they exist
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end

  # Returns true if current_user exists, false otherwise
  def logged_in?
    !current_user.nil?
  end

  def verify_password(password, verification)
    password == verification
  end

end

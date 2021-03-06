module SessionsHelper
  # Logs in the given user.
  def log_in(admin)
    session[:admin_id] = admin.id
  end

  # Remembers a user in a persistent session.
  def remember_admin(admin)
    admin.remember
    cookies.permanent.signed[:admin_id] = admin.id
    cookies.permanent[:remember_token] = admin.remember_token
  end

  def remember_user(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Returns true if the given user is the current user.
  def current_admin?(admin)
    admin == current_admin
  end

  # Returns the current logged-in user (if any).
  def current_admin
    if (admin_id = session[:admin_id])
      @current_admin ||= Admin.find_by(id: admin_id)
    elsif (admin_id = cookies.signed[:admin_id])
      admin = Admin.find_by(id: admin_id)
      if admin && admin.authenticated?(cookies[:remember_token])
        log_in admin
        @current_admin = admin
      end
    end
  end

  # Returns true if the given user is the current user.
  def current_user?(user)
    user == current_user
  end

  # Returns the current logged-in user (if any).
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_admin.nil?
  end

  # Forgets a persistent session.
  def forget_admin(admin)
    admin.forget_admin
    cookies.delete(:admin_id)
    cookies.delete(:remember_token)
  end

  def forget_user(user)
    user.forget_user
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current user.
  def log_out_user
    forget_user(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def log_out_admin
    forget_admin(current_admin)
    session.delete(:admin_id)
    @current_admin = nil
  end

  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end

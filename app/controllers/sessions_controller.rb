class SessionsController < ApplicationController
  def new
  end

  def admin_create
    admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      # Log the admin in and redirect to the admin's show page.
      log_in admin
      params[:session][:remember_me] == '1' ? remember_admin(admin) : forget_admin(admin)
      redirect_back_or admin
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def user_create
    user = User.find_by(contact: params[:session][:contact].downcase)
    if user
      # Log the user in and redirect to the user's show page.
      log_in user
      params[:session][:remember_me] == '1' ? remember_user(user) : forget_user(user)
      redirect_back_or user
    else
      flash[:danger] = "Woops! We couldn\'t find your contact."
      render 'new'
    end
  end

  def destroy
    log_out_admin if logged_in?
    redirect_to root_url
  end
end

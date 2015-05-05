class SessionsController < ApplicationController
  def new
  end

  def create
   admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      # Log the admin in and redirect to the admin's show page.
      log_in admin
      params[:session][:remember_me] == '1' ? remember(admin) : forget(admin)
      redirect_back_or admin
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
  	log_out if logged_in?
    redirect_to root_url
  end
end

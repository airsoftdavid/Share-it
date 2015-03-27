class SessionsController < ApplicationController
  def new
  end

   def create
    user = User.find_by(contact: params[:session][:contact].downcase)
    if user && user.authenticate(params[:session][:contact])
      # Log the user in and redirect to the user's show page.
       log_in user
       params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      # Create an error message.
      flash.now[:danger] = 'Sorry! We cannot seem to find your number.'

      render 'new'
    end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end
end

class StaticPagesController < ApplicationController
  def home
  	  @user = current_admin.users.build if logged_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end

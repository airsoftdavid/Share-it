class UsersController < ApplicationController
    before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
    	log_in @user
      # Handle a successful save.
      flash[:success] = "Welcome to Share-It!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to_users_url
  end

  private

  def user_params
  	params.require(:user).permit(:name, :contact)
  end
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
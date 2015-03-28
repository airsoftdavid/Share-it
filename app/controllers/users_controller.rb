class UsersController < ApplicationController
    before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
    # render json: @users, status: :ok
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
      format.json { render :json => @users }
     end
  end
  
  def show
    @user = User.find(params[:id])
    render json: @user if stale?(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json:@user, status: :created
    	log_in @user
      # Handle a successful save.
      flash[:success] = "Welcome to Share-It!"
      redirect_to @user
    else
      render json: @user.errors, status: :unprocessable_entity
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    head :no_contact
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
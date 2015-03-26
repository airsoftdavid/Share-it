class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      # Handle a successful save.
      flash[:success] = "Welcome to Share-It!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def user_params
  	params.require(:user).permit(:name, :contact)
  end
end
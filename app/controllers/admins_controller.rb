class AdminsController < ApplicationController
  before_action :logged_in_admin, only: [:edit, :update] #may be an issue
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  before_action :correct_admin,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.paginate(:page => params[:page])
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
    @admin = Admin.find(params[:id])
    @users = @admin.users.paginate(page: params[:page])
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end
 
  # GET /admins/1/edit
  def edit
    @admin = Admin.find(params[:id])
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)
    respond_to do |format|
      if @admin.save
        log_in @admin
        format.html { redirect_to @admin, notice: 'Success! Welcome to Share-It!' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      if @admin.update_attributes(admin_params)
        format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
      Admin.find(params[:id]).destroy
      respond_to do |format|
      format.html { redirect_to admins_url, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:username, :email, :password, :password_confirmation)
    end

    # Before filters

    # Confirms a logged-in admin.
    def logged_in_admin
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to signin_url#
      end
    end

    # Confirms the correct user.
    def correct_admin
      @admin = Admin.find(params[:id])
      redirect_to(root_url) unless @admin == current_admin?(@admin)
    end

    # Confirms an admin user.
    def admin_user
     redirect_to(root_url) unless current_admin.admin?
    end
end

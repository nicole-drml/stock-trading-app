class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = User.all
  end

  def dashboard
    @users = User.all
  end

  def pending_users
    @users = User.all
  end

  # def show
  # end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if current_user && !current_user.admin?
      return
    end
    
    @user.status = :active

    respond_to do |format|
      if @user.save
        RegistrationMailer.account_created(@user).deliver
      # else
      #   format.html { render :new, status: :unprocessable_entity }
      #   format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @old_status = @user.status

    respond_to do |format|
      if @user.update(user_params)
        application_approved
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_dashboard_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role, :status)
    end

    def application_approved
      if @user.status != @old_status
        if @user.status == "active"
          RegistrationMailer.application_approved(@user, current_user).deliver
        end 
      end
    end
end

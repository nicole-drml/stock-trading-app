# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  
  #GET /resource/sign_up
  def new
    @user = User.new
    super
  end

  #POST /resource
  def create
    binding.pry
    @user = User.new(user_params)
    super

    if current_user && !current_user.admin?
      return
    end
    
    respond_to do |format|
      if @user.save
        RegistrationMailer.new_pending_user(@user).deliver
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    
  end

  #GET /resource/edit
  def edit
    super
  end

  #PUT /resource
  def update
    super
  end

  #DELETE /resource
  def destroy
    super
  end

  #GET /resource/cancel
  #Forces the session data which is usually expired after sign
  #in to be expired now. This is useful if the user wants to
  #cancel oauth signing in/up in the middle of the process,
  #removing all OAuth session data.
  def cancel
    super
  end

  protected

  #If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  #If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  #The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  #The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role, :status)
  end

end

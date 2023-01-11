class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :configure_permitted_signin_parameters, if: :devise_controller?
    before_action :configure_permitted_role_parameters, if: :devise_controller?


    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username])
      end
  
    def configure_permitted_signin_parameters
        devise_parameter_sanitizer.permit(:sign_in) do |user_params|
        user_params.permit(:username, :email)
        end
    end

    def configure_permitted_role_parameters
        devise_parameter_sanitizer.permit(:sign_up) do |user_params|
          user_params.permit({ roles: [:trader, :admin] }, :email, :password, :password_confirmation)
        end
      end

end

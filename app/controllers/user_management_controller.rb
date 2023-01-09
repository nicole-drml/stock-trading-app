class UserManagementController < ApplicationController
    before_action :set_current_user, only: %i[ show edit update destroy ]
    before_action :set_selected_user, only: %i[ show edit update destroy ]

    def show
    end
    
    private
    def set_current_user
        if session[:user_id]
            @current_user = User.find_by(id: session[:user_id])
        end
    end

    def set_selected_user
        @selected_user = User.find(params[:id])
    end
end

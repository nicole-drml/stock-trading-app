class AdminController < ApplicationController
    def index
        @users = User.all
    end

    def pending_users
        @users = User.all
    end
end

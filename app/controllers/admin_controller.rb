class AdminController < ApplicationController
  before_action :set_selected_user, only: %i[ show edit update destroy ]

  def index
    @users = User.all
  end

  def create
    @user = User.new
    respond_to do |format|
      if @user.save
              format.html { render :index, notice: "Successfully created account" }
      else
          format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  private
  
  def set_selected_user 
    @selected_user = User.find(params[:id])
  end
end

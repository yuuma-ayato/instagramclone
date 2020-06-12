class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if params[:back]
      render :new
    else
      if @user.save
        redirect_to user_path(@user.id)
      else
        render :new
      end
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation,
      :image, :image_cache)
    end
  end

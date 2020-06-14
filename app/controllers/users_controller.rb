class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to user_path, notice: "編集しました！"
      else
        render :show
      end
  end

  def show
    @user = User.find(params[:id])
  end

  def favorite_index
    @favorite = current_user.favorite_pictures
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,
                                 :image, :image_cache)
    end
  end

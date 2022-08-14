class UsersController < ApplicationController
  def show
    @rooms = Room.where(user_id: current_user.id)
  end

  def profile
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to account_users_path
    else
      render profile_users_path
    end
  end

  def account
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image, :image_cache)
  end
end

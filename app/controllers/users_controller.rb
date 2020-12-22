class UsersController < ApplicationController
  def show
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      redirect_to action:show
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email) # 編集出来る情報を制限
  end
end

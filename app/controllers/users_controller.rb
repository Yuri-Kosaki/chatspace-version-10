class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(update_params)
      redirect_to group_messages_path, notice: "ユーザー情報を更新しました。"
    else
      flash.now[:alert] = "ユーザー情報の更新に失敗しました。"
    end
  end

  private
  def update_params
    params.require(:user).permit(:nickname, :email, :password)
  end

end

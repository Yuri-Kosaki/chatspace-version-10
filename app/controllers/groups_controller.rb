class GroupsController < ApplicationController

  def index
    @groups = Group.order("created_at ASC")
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
     if @group.save
      redirect_to group_messages_path, notice: "グループを作成しました"
    else
      flash.now[:alert] = "グループ名を入力してください"
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.update(group_params)
      redirect_to group_messages_path, notice: "グループ情報を更新しました。"
    else
      flash.now[:alert] = "グループ情報の更新に失敗しました。"
    end

  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end

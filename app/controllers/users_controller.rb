class UsersController < ApplicationController
  def index
    @user= current_user
    @users = User.all
    @all_ranks = Event.create_all_ranks
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
        redirect_to user_path(current_user.id)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
        flash[:notice] = "更新に成功しました。"
        redirect_to user_path
    else
        render:edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.id != current_user.id
        redirect_to user_path(current_user.id)
        flash[:notice] = "削除に成功しました。"
    end
  end

  private
  def user_params
      params.require(:user).permit(:name, :introduction, :avator_image)  
  end
end

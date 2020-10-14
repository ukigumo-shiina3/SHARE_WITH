class UsersController < ApplicationController
  def index
    @user= current_user
    @users = User.all.page(params[:page]).per(5)
    @all_ranks = Event.create_all_ranks
  end

  def show
    @user = User.find(params[:id])
    @events = Event.where(user_id: @user.id)
    @event = Event.new
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
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

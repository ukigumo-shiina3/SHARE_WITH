class UsersController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @user= current_user
    @users = User.all.page(params[:page]).per(5).reverse_order
    @all_ranks = Event.create_all_ranks
  end

  def show
    @user = User.find(params[:id])
    @schedules = Schedule.where(user_id: @user.id)
    @schedule = Schedule.new
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)  #「チャットへ」を押されたユーザー
    
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
        #roomsが作成されている場合と作成されていない場合の条件分岐
          if cu.room_id == u.room_id then 
            @isRoom = true  #trueの時は、チャットへボタンを出現させ、すでに作成されたチャットへと移行
            #falseの時は、Roomを作成
            @roomId = cu.room_id  #すでに作成されているroom_idを特定
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

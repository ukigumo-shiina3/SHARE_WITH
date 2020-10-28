class EventsController < ApplicationController

  before_action :authenticate_user!, except: [:new_guest]
  
  def new 
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id 
    post_date = params["event"]["event_date(1i)"] << "-" << params["event"]["event_date(2i)"] << "-" << params["event"]["event_date(3i)"]
    @event.event_date = post_date.to_date
    if @event.save
      flash[:notice] = "イベントを作成しました。"
      redirect_to events_path
    else
      render 'new'
    end
    @events = Event.where(user_id: current_user.id)
  end

  def index
    if current_user
      @event = Event.new
      @events = Event.all.page(params[:page]).per(7).reverse_order
      @all_ranks = Event.create_all_ranks
      @schedules = Schedule.where(user_id: current_user.id) #JSON形式
    else
      @events = Array.new #ログインしてない状態のトップページ表示
      @schedules = Array.new 
      @all_ranks = Array.new
    end
  end

  def show
    @event = Event.find(params[:id]) 
    @comments = @event.comments  
    @user = @event.user 
    @comment = Comment.new
  end

  def edit
    @event = Event.find(params[:id])
        if @event.user_id != current_user.id
            redirect_to events_path
        end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
        flash[:notice] = "イベントを更新しました。"
        redirect_to events_path
    else
        render:edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @event = Event.find(params[:id])
        @event.destroy
        flash[:notice] = "イベントを削除しました。"
        redirect_to events_path
  end

  def new_guest
    user = User.find_or_create_by!(name: 'test user', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.introduction = 'I am guest user'
    end
    sign_in(:user, user)
    redirect_to events_path
  end

  private
    def event_params
      params.require(:event).permit(:user_id, :genre_id, :title, :body, :image, :open_hour, :open_minute,:end_hour,:end_minute, :recruitment)
    end
end
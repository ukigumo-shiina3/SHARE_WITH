class EventsController < ApplicationController
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
    # @events = @genre.events.all
    if current_user != nil
      @events = Event.all.page(params[:page]).per(7)
      @event = Event.new(event_params)
      @all_ranks = Event.create_all_ranks
      @schedules = Schedule.where(user_id: current_user.id) #JSON形式
    else
      @events = Array.new
      @schedules = Array.new #ログインしてない状態のトップページ
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
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  private
    def event_params
      params.require(:event).permit(:user_id, :genre_id, :title, :body, :image, :event_hour, :event_minute, :recruitment)
    end
end
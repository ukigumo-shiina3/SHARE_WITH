class SchedulesController < ApplicationController
    # def create
    #     schedule = Schedule.new(schedule_params)
    #     schedule.save!
    #     @schedules = Schedule.where(user_id: current_user.id)
    # end

    # def update
    #     schedule = Schedule.find(params[:id])
    #     @schedules = Schedule.where(user_id: current_user.id)
    #     schedule.update(schedule_params)
    # end

    # def destroy
    #     @user = User.find(params[:id])
    #     schedule = Schedule.find(params[:id])
    #     schedule.destroy
    #     redirect_to schedule_path(@user)
    # end

    # private
    # def schedule_params
    #     params.require(:schedule).permit(:title, :start, :end, :user_id, :body)
    # end
end

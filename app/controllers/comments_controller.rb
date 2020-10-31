class CommentsController < ApplicationController

    before_action :authenticate_user!

    def create
        @event = Event.find(params[:event_id])
        comment = current_user.comments.new(comment_params)
        comment.event_id = @event.id
        comment.save
        @comments = @event.comments
    end

    def destroy
        @event = Event.find(params[:event_id])
        comment = Comment.find(params[:id])
        comment.destroy
        @comments = @event.comments
    end

    private
    def comment_params
        params.require(:comment).permit(:comment, :user_id, :event_id)
    end
end

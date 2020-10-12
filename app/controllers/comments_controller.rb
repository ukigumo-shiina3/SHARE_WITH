class CommentsController < ApplicationController

    def create
        event = Event.find(params[:event_id])
        comment = current_user.comments.new(comment_params)
        comment.event_id = event.id
        comment.save
        redirect_to event_path(event.id)
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        redirect_to event_path(params[:event_id])
    end

    private
    def comment_params
        params.require(:comment).permit(:comment, :user_id, :event_id)
    end
end

class CommentsController < ApplicationController
  def index
    @comments = Comment.all.order("created_at DESC")
    @comments = Comment.page(params[:page]).per(10).order("created_at DESC")
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to  root_path
    else
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id)
  end
end
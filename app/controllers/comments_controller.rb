class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.create(comment_params)
    redirect_to sandwich_path
  end

  private
  def comment_params
    params.require(:comment).permit(:text, eater_attributes: [:id, :name])
  end
end

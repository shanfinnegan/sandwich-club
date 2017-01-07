class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end
  
  private
  def comment_params
    params.require(:comment).permit(:text, :sandwich_id, :eater_id, eater_attributes: [:id, :name])
  end
end

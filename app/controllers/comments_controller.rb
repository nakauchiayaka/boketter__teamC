class CommentsController < ApplicationController
  before_action :comment_check, only:[:create, :update]

  def create
    if @comment_check == true
      @comment = Comment.create(user_id: current_user.id, boke_id: params[:boke_id], text: params[:comment][:text])
      respond_to do |format|
        format.html
        format.json
      end
    end
  end

  def update
    if @comment_check == true
      @comment = Comment.find(params[:id])
      @comment.update(text: params[:comment][:text])
      respond_to do |format|
        format.html
        format.json
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :boke_id)
  end

  def comment_check
    comment = params[:comment][:text]
    if comment.present? && comment.length <= 60
      @comment_check = true
    end
  end
end

class CommentsController < ApplicationController

  def create
    @comment = Comment.create(user_id: current_user.id, boke_id: params[:boke_id], text: params[:comment][:text])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def update
    if params[:comment][:text].present?
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
end

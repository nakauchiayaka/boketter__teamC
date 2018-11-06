class StarsController < ApplicationController
  def create
    @star = Star.create(user_id: current_user.id, boke_id: params[:boke_id])
    @stars = Star.where(boke_id: params[:boke_id])
    @bokes = Boke.all

    respond_to do |format|
      format.html
      format.json
    end
  end

  def destroy
    @star = current_user.stars.find_by(boke_id: params[:boke_id])
    @star.destroy
    respond_to do |format|
      format.html
      format.json
    end
  end
end

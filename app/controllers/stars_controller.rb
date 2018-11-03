class StarsController < ApplicationController
  def create
    @star = Star.create(user_id: current_user.id, boke_id: params[:boke_id],status:params[:status])
    @stars = Star.where(boke_id: params[:boke_id])
    @bokes = Boke.all
  end

  def destroy
    star = Star.find_by(user_id: current_user.id, boke_id: params[:boke_id])
    star.destroy
    @stars = Star.where(boke_id: params[:boke_id])
    @bokes = Boke.all
  end
end

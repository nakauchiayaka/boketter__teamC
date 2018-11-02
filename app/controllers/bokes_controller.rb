class BokesController < ApplicationController
  before_action :set_odai, except: :index
  def index
    @bokes = Boke.order("created_at DESC")
  end

  def new
    @boke =Boke.new
  end

  def create
    @boke = Boke.create(text: boke_params[:text], odai_id: params[:odai_id], user_id: current_user.id)

  end

  #def hot
    #@bokes = Boke.order("created_at DESC")
    #redirect_to index
  #end

  private
  def boke_params
    params.require(:boke).permit(:text)
  end

  def set_odai
    @odai = Odai.find(params[:odai_id])
  end
end

class OdaisController < ApplicationController
  def index
    @odais = Odai.order("created_at DESC")
  end
   def new
    @odai =Odai.new
   end
   def create
    Odai.create(title: odai_params[:title],image: odai_params[:image],user_id: current_user.id)
   end


   private
   def odai_params
    params.require(:odai).permit(:title,:image)
   end
end

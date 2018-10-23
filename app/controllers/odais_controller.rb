class OdaisController < ApplicationController
  def index
    @odais = Odai.all
  end
   def new
    @odai =Odai.new
   end
   def create
    odai = Odai.create(odai_params)
   end


   private
   def odai_params
    params.require(:odai).permit(:title,:image)
   end
end

class OdaisController < ApplicationController
  before_action :move_to_index, except: :index
  def index
    @odais = Odai.order("created_at DESC")
  end
  def new
    @odai =Odai.new
  end
  def create
    Odai.create(title: odai_params[:title],image: odai_params[:image],user_id: current_user.id,category_id: odai_params[:category_id])
  end

  def jinbutsu
    @odais = Odai.where(category_id:1)
  end
  def jinbutsu2ri
    @odais = Odai.where(category_id:2)
  end
  def animal
    @odais = Odai.where(category_id:3)
  end
  def scenery
    @odais = Odai.where(category_id:4)
  end
  def inorganicmatter
    @odais = Odai.where(category_id:5)
  end
  def illustration
    @odais = Odai.where(category_id:6)
  end
  def other
    @odais = Odai.where(category_id:7)
  end


  private
  def odai_params
    params.require(:odai).permit(:title,:image,:category_id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end

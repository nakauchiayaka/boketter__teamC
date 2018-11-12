class OdaisController < ApplicationController
  before_action :move_to_index, except: :index
  before_action :set_odais

  def index
    @odais = Odai.order("created_at DESC").limit(4)
    @more = Odai.where('id < ?', params[:id]).order("created_at DESC").limit(4)
    @odai_random = Odai.order("RAND()").first
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @odai =Odai.new
    @odai_random = Odai.order("RAND()").first
  end
  def create
    @odai_random = Odai.order("RAND()").first
    Odai.create(title: odai_params[:title],image: odai_params[:image],user_id: current_user.id,category_id: odai_params[:category_id])
  end

  def show
  @odai = Odai.find(params[:id])
  @bokes = Boke.where(odai_id: params[:id])
  end

  def search
    @odai_random = Odai.order("RAND()").first
    @odais = Odai.where('title LIKE(?)', "%#{params[:keyword]}%").limit(20)
    respond_to do |format|
    format.html
    format.json
   end
  end

  def preview

  end

  def jinbutsu
    @odais = Odai.where(category_id:1)
    @odai_random = Odai.order("RAND()").first
  end
  def jinbutsu2ri
    @odais = Odai.where(category_id:2)
    @odai_random = Odai.order("RAND()").first
  end
  def animal
    @odais = Odai.where(category_id:3)
    @odai_random = Odai.order("RAND()").first
  end
  def scenery
    @odais = Odai.where(category_id:4)
    @odai_random = Odai.order("RAND()").first
  end
  def inorganicmatter
    @odais = Odai.where(category_id:5)
    @odai_random = Odai.order("RAND()").first
  end
  def illustration
    @odais = Odai.where(category_id:6)
    @odai_random = Odai.order("RAND()").first
  end
  def other
    @odais = Odai.where(category_id:7)
    @odai_random = Odai.order("RAND()").first
  end


  private
  def odai_params
    params.require(:odai).permit(:title,:image,:category_id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  def set_odais
    @odais = Odai.all
  end
end

class BokesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_odai, only: [:new, :create]
  def index
    @bokes = Boke.order("created_at DESC").page(params[:page]).per(4)
    @stars = Star.where(boke_id: params[:id])
  end

  def new
    @boke =Boke.new
  end

  def create
    @bokes = Boke.create(text: boke_params[:text], odai_id: params[:odai_id], user_id: current_user.id,category_id: boke_params[:category_id])
  end

  def edit
    @boke = Boke.find(params[:id])

  end

  def update
    @boke = Boke.find(params[:id])
    @boke.update(boke_params)
  end

  def show
    @boke = Boke.find(params[:id])
    @comments = Comment.includes(:user).where(boke_id: params[:id])
    @stars = Star.where(boke_id: params[:id])
  end

  def baka
    @bokes = Boke.where(category_id:8).order("created_at DESC")
  end
  def surreal
    @bokes = Boke.where(category_id:9).order("created_at DESC")
  end
  def ogeretu
    @bokes = Boke.where(category_id:10).order("created_at DESC")
  end
  def black
    @bokes = Boke.where(category_id:11).order("created_at DESC")
  end
  def relative
    @bokes = Boke.where(category_id:12).order("created_at DESC")
  end
  def example
    @bokes = Boke.where(category_id:13).order("created_at DESC")
  end
  def other
    @bokes = Boke.where(category_id:14).order("created_at DESC")
  end

  private
  def boke_params
    params.require(:boke).permit(:text,:category_id)
  end

  def move_to_index
    redirect_to notlogin_titles_path unless user_signed_in?
  end

  def set_odai
    @odai = Odai.find(params[:odai_id])
  end
end

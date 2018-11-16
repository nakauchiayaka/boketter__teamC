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

  def destroy
    boke = Boke.find(params[:id])
    if boke.user_id == current_user.id
      boke.destroy
    end
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
    @bokes = Boke.where(category_id:8).order("created_at DESC").page(params[:page]).per(4)
  end
  def surreal
    @bokes = Boke.where(category_id:9).order("created_at DESC").page(params[:page]).per(4)
  end
  def ogeretu
    @bokes = Boke.where(category_id:10).order("created_at DESC").page(params[:page]).per(4)
  end
  def black
    @bokes = Boke.where(category_id:11).order("created_at DESC").page(params[:page]).per(4)
  end
  def relative
    @bokes = Boke.where(category_id:12).order("created_at DESC").page(params[:page]).per(4)
  end
  def example
    @bokes = Boke.where(category_id:13).order("created_at DESC").page(params[:page]).per(4)
  end
  def other
    @bokes = Boke.where(category_id:14).order("created_at DESC").page(params[:page]).per(4)
  end

  def user_ranking
    @users = User.all

    sum_total = []
    @users.each do |user|
      @bokes = Boke.where(user_id:user.id)
      @sum = 0

      @bokes.each do |boke|
        stars = Star.where(boke_id:boke.id)
        stars.each do |star|
          @sum += star.status
        end
      end
      sum_total << @sum
      sum_array = sum_total.sort {|a, b| b <=> a }
      if @sum == sum_array[0]
        @user_1 = user
        @user_1_sum = @sum
        @bokes_user_1 = Boke.where(user_id:@user_1.id).limit(3).order("created_at DESC")
      elsif @sum ==sum_array[1]
        @user_2 = user
        @user_2_sum = @sum
        @bokes_user_2 = Boke.where(user_id:@user_2.id).limit(3).order("created_at DESC")
      elsif @sum ==sum_array[2]
        @user_3 = user
        @user_3_sum = @sum
        @bokes_user_3 = Boke.where(user_id:@user_3.id).limit(3).order("created_at DESC")
      end
    end

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

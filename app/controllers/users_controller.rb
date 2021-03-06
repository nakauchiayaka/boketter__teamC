class UsersController < ApplicationController
  before_action :password_check, only: [:password_update]

  def show
    @user = User.find(params[:id])
    @bokes_recent = Boke.where(user_id:@user.id).order("created_at DESC").limit(3)
    @odais_recent = Odai.where(user_id:@user.id).order("created_at DESC").limit(2)
    @stars = Star.where(user_id:@user.id).order("created_at DESC").limit(3)
    @stars_recent = []
    @stars.each do |star|
      @stars_recent << Boke.find(star.boke_id)
    end

    @odais = Odai.where(user_id:@user.id)
    @bokes = Boke.where(user_id:@user.id)
    @sum = 0
    @bokes.each do |boke|
      stars = Star.where(boke_id:boke.id)
      stars.each do |star|
        @sum += star.status
      end
    end
    return @sum
  end

  def boke
    @user = User.find(params[:id])
    @bokes = Boke.where(user_id:params[:id]).order("created_at DESC")
  end

  def odai
    @user = User.find(params[:id])
    @odais = Odai.where(user_id:params[:id]).order("created_at DESC")
  end

  def favorites
    @user = User.find(params[:id])
  end

  def ratings1
    @user = User.find(params[:id])
    @bokes= []
    @stars_favorite = Star.where(user_id:params[:id])
    @stars_favorite.each do |star|
      if star.status == 1
        boke_favorite = star.boke
        @bokes << boke_favorite
      end
    end
  end

  def ratings2
    @user = User.find(params[:id])
    @bokes= []
    @stars_favorite = Star.where(user_id:params[:id])
    @stars_favorite.each do |star|
      if star.status == 2
        boke_favorite = star.boke
        @bokes << boke_favorite
      end
    end
  end

  def ratings3
    @user = User.find(params[:id])
    @bokes= []
    @stars_favorite = Star.where(user_id:params[:id])
    @stars_favorite.each do |star|
      if star.status == 3
        boke_favorite = star.boke
        @bokes << boke_favorite
      end
    end
  end


  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def password_update
    password_check
    if @password_change
      current_user.update(password: user_params[:new_password])
      bypass_sign_in current_user
      render template: "accounts/password"
    else
      @error_message = "エラーが発生しました"
      flash[:error] = @error_message
      render template: "accounts/password"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :current_password, :new_password, :password_confirmation, :image)
  end

  def password_check
    new_password = user_params[:new_password]
    if current_user.valid_password?(user_params[:current_password]) && new_password == user_params[:password_confirmation]
      if new_password.length >= 4 && new_password.length <= 20
        @password_change = true
      end
    end
  end

end

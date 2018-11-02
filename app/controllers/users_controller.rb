class UsersController < ApplicationController
  # before_action :name_check, only:[:update]
  before_action :password_check, only: [:password_update]

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

  private

  def user_params
    params.require(:user).permit(:name, :email, :current_password, :new_password, :password_confirmation, :image)
  end
end

def password_check
  new_password = user_params[:new_password]
  if current_user.valid_password?(user_params[:current_password]) && new_password == user_params[:password_confirmation]
    if new_password.length >= 4 && new_password.length <= 20
      @password_change = true
    end
  end
end

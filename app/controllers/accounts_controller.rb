class AccountsController < ApplicationController

  def my
  end

  def edit
  end

  def photo
  end

  def password
    @password_change = false
  end

  def email
  end

  def delete
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end

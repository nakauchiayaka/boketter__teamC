class AccountsController < ApplicationController

  def edit
  end

  def photo
  end

  def password
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

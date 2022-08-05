
class UsersController < ApplicationController
  respond_to :json
before_action :authenticate_user!
# GET /users/profile
  def profile
    render json:  current_user
  end

  # PATCH users/change_password
  def update_password
    @user = current_user
    if @user.update(user_params)
      bypass_sign_in(@user)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end

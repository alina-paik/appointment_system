
class UsersController < ApplicationController
# /users/profile
before_action :authenticate_user!
respond_to :json
  def profile
    render json:  current_user
  end
end

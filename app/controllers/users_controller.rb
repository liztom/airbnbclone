class UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @listings = @user.listings
  end

  private
    def user_params
      params.require[:user].permit(:name, :email, :password, :password_confirmation, :current_password, :avatar, :bio)
    end
end

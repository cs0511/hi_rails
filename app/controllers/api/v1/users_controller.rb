class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_user, only: [:show, :update]

  def index
    p Time.now

    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
  end

  def me
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def set_user
    @user = User.find(params[:id])

  end
end

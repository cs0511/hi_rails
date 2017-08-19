class Api::V1::SessionsController < Api::V1::BaseController
  def index

    @users = User.all
  end

  def show
    @user = User.last

  end

  def me
    @user = User.last
  end

end

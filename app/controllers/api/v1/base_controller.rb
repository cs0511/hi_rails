class Api::V1::BaseController < ApplicationController
  include Knock::Authenticable

  # skip_before_action :protect_from_forgery

  # disable the CSRF token
  # protect_from_forgery with: :null_session

  # disable the CSRF token
  # skip_before_action :verify_authenticity_token

  skip_before_action :authenticate_user!
  before_action :authenticate_user
  undef_method :current_user


end

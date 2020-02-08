class ApplicationController < ActionController::API
  # before_filter do
  #   # byebug
  #   headers['Access-Control-Allow-Origin'] = '*'
  # end
  # skip_before_action :verify_authenticity_token
  protect_from_forgery with: :exception
end

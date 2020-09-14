class ApplicationController < ActionController::Base
　before_action :basic_auth

  def index
    
  end

  private

  def basic_auth
    autenticate_or_request_wirh_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

end

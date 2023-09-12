class ApplicationController < ActionController::Base


  before_action :http_basic_authenticate

  def http_basic_authenticate
    auth_token = '101'
    if request.headers['Authorization']&.split(' ')&.[](1) != auth_token
      render :json => { message: 'access denied' }, :status => 401
    end
  end
  
  protect_from_forgery unless: -> { request.format.json? }
  def not_found
    payload = {
      error: "Resource not found",
      status: 404
    }
    respond_to do |format|
      format.html { render :template => '/application/not_found',    :status => 404 }
      format.xml {  render :xml => payload.to_xml,             :status => 404 }
      format.json { render :json => payload.to_json,            :status => 404 }
    end
  end
end


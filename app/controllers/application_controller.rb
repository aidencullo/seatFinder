class ApplicationController < ActionController::Base
  before_action :set_headers

  protect_from_forgery
  
  around_action :handle_exceptions

  def set_headers
    response.headers['Content-Type'] = 'application/json'
  end
  
  def handle_exceptions
    begin
      yield
    rescue ActiveRecord::RecordNotFound => e
      head :not_found
    end
  end

  def not_found
    head :not_found
  end
end


class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  def not_found
    respond_to do |format|
      format.html { head :not_found }
      format.json { head :not_found }
    end
  end
end


# lib/middleware/verify_token.rb

module Middleware
  class VerifyToken
    def initialize(app)
      @app = app
    end
  
    def call(env)
      request = ActionDispatch::Request.new(env)
      if request.headers['token'] != 'my-secret-token'
        return [401, { 'Content-Type' => 'application/json' }, [ {
  :error => 'invalid token' }.to_json ]]
      end  
      @app.call(env)
    end
  end
end

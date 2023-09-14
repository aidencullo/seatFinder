# lib/middleware/verify_token.rb

module Middleware
  class VerifyToken
    def initialize(app)
      @app = app
    end
    
    def call(env)
      request = ActionDispatch::Request.new(env)
      if request.path.include? "/api/v1"
        if request.headers['token'] != '8b36056f81e2df855c7a61fd6cc7bee5038380cb5ec39b77b2d389fe77556202'
          return [401, { 'Content-Type' => 'application/json' }, [ {
                                                                     :error => 'invalid token' }.to_json ]]
        end  
      end
      @app.call(env)
    end
  end
end

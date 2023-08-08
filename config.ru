# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

run Rails.application
Rails.application.load_server
if Rails.env.development?
  Launchy.open("http://localhost:3000")
end

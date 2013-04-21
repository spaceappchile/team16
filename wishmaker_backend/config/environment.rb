# Load the rails application
require File.expand_path('../application', __FILE__)
APN::App::RAILS_ENV = 'development'
# Initialize the rails application
WishmakerBackend::Application.initialize!

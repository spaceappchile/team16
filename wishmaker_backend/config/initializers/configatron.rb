require 'configatron'
Configatron::Rails.init

# development (delivery):
 configatron.apn.passphrase # => ''
 configatron.apn.port # => 2195
 configatron.apn.host # => 'gateway.sandbox.push.apple.com'
 configatron.apn.cert #=> File.join(RAILS_ROOT, 'config','andate_apple_push_notification_development.pem')

class MobileUser < ActiveRecord::Base
has_many :apn_devices, :dependent => :delete_all  # attr_accessible :title, :body
end

class AddParentToApnDevice < ActiveRecord::Migration
  def change
    add_column :apn_devices, :mobile_user_id, :integer
  end
end

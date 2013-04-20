class AddParentToGcmDevice < ActiveRecord::Migration
  def change
    add_column :gcm_devices, :mobile_user_id, :integer
  end
end

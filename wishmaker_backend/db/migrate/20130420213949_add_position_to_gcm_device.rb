class AddPositionToGcmDevice < ActiveRecord::Migration
  def change
    add_column :gcm_devices, :the_geom, :point
  end
end

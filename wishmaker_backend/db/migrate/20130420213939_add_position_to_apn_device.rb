class AddPositionToApnDevice < ActiveRecord::Migration
  def change
    add_column :apn_devices, :the_geom, :point
  end
end

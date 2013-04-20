class CreateMobileUsers < ActiveRecord::Migration
  def change
    create_table :mobile_users do |t|
      t.string :username
      t.string :passwod
      t.datetime :birthday
      t.integer :platform
      t.point :the_geom, :srid => 4326, :has_z => true
      t.timestamps
    end
  end
end

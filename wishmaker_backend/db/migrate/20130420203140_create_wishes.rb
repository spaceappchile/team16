class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.references :mobile_user
      t.references :meteor
      t.text :description
      t.boolean :made
      t.point :the_geom, :srid => 4326, :has_z => true

      t.timestamps
    end
    add_index :wishes, :user_id
    add_index :wishes, :meteor_id
  end
end

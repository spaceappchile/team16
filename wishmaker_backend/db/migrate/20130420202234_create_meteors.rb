class CreateMeteors < ActiveRecord::Migration
  def change
    create_table :meteors do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.datetime :starting
      t.datetime :ending
      t.string :address
      t.string :photo
      t.point :the_geom, :srid => 4326, :has_z => true

      t.timestamps
    end
  end
end

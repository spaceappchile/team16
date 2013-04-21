class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :name
      t.point :the_geom
      t.integer :experience
      t.string :location
      t.string :witness
      t.references :meteor

      t.timestamps
    end
    add_index :reports, :meteor_id
  end
end

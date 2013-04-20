class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.references :user
      t.references :meteor
      t.text :description
      t.boolean :made

      t.timestamps
    end
    add_index :wishes, :user_id
    add_index :wishes, :meteor_id
  end
end

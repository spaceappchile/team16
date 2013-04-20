class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.datetime :birthday
      t.integer :sex

      t.timestamps
    end
  end
end

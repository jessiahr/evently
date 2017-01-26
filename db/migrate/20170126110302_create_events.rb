class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :message
      t.string :hostname
      t.datetime :timestamp
      t.integer :organization_id

      t.timestamps null: false
    end
  end
end

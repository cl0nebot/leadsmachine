class CreateTrackingNumbers < ActiveRecord::Migration
  def change
    create_table :tracking_numbers do |t|
      t.string :phone
      t.integer :status, default: 0, null: false
      t.references :machine, index: true, foreign_key: true
      t.integer :provider, default: 0, null: false

      t.timestamps null: false
    end
  end
end

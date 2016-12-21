class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.references :user, index: true, foreign_key: true
      t.string :city
      t.integer :province, default: 0, null: false
      t.string :service

      t.timestamps null: false
    end
  end
end

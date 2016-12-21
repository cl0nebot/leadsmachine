class CreateBlacklists < ActiveRecord::Migration
  def change
    create_table :blacklists do |t|
      t.string :number
      t.string :description

      t.timestamps null: false
    end
    add_index :blacklists, :number
  end
end

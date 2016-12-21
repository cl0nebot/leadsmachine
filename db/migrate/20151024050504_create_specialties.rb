class CreateSpecialties < ActiveRecord::Migration
  def change
    create_table :specialties do |t|
      t.string :name
      t.integer :leadvalue
      t.references :subcategory, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

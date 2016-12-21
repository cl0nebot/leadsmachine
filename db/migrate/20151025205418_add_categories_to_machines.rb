class AddCategoriesToMachines < ActiveRecord::Migration
  def change
    add_reference :machines, :category, index: true, foreign_key: true
    add_reference :machines, :subcategory, index: true, foreign_key: true
    add_reference :machines, :specialty, index: true, foreign_key: true
    remove_column :machines, :service, :string
  end
end

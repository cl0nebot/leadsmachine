class AddCityIdToMachines < ActiveRecord::Migration
  def change
    remove_column :machines, :city
    add_reference :machines, :city, index: true, foreign_key: true
  end
end

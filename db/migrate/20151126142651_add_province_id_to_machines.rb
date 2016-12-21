class AddProvinceIdToMachines < ActiveRecord::Migration
  def change
    remove_column :machines, :province
    add_reference :machines, :province, index: true, foreign_key: true
  end
end

class AddParentToMachines < ActiveRecord::Migration
  def change
    add_column :machines, :parent, :integer, limit: 8
  end
end

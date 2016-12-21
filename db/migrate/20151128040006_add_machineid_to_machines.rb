class AddMachineidToMachines < ActiveRecord::Migration
  def change
    add_column :machines, :lmid, :integer, limit: 8
    add_column :machines, :slug, :string, index: true
  end
end

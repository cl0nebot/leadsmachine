class AddMoneyfielsToMachines < ActiveRecord::Migration
  def change
    add_column :machines, :price, :integer
  end
end

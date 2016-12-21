class AddRetainerToMachines < ActiveRecord::Migration
  def change
  	remove_column :machines, :retainer, :integer
    remove_column :machines, :retainercpl, :integer
    remove_column :machines, :leadguarantee, :integer
    remove_column :machines, :guaranteedate, :datetime
  end
end

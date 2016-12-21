class AddMachineIdToProperties < ActiveRecord::Migration
  def change
  	remove_column :properties, :prop_type, :string
  	remove_column :properties, :prop_id, :integer
  	add_column 		:properties, :machine_id, :integer
  end
end

class FixCpl < ActiveRecord::Migration
  def change
    add_column :machines, :retainer, :integer
    add_column :machines, :retainercpl, :integer
    add_column :machines, :leadguarantee, :integer
    add_column :machines, :guaranteedate, :datetime
    remove_column :machines, :price
    add_column :machines, :cpl, :integer
  end
end

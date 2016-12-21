class AddMapToCities < ActiveRecord::Migration
  def change
    add_column :cities, :mapurl, :text
  end
end

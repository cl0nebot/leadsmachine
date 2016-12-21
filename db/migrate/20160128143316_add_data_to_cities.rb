class AddDataToCities < ActiveRecord::Migration
  def change
    add_column :cities, :govurl, :string
    add_column :cities, :wikiurl, :string
    add_column :cities, :descr, :text
  end
end

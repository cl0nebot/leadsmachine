class AddMapToBusinessLeads < ActiveRecord::Migration
  def change
    add_column :provinces, :mapurl, :text
  end
end

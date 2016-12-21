class CreateCitations < ActiveRecord::Migration
  def change
    create_table :citations do |t|
      t.references :citation_source, index: true, foreign_key: true
      t.references :property, index: true, foreign_key: true
      t.boolean :napmatch
      t.string :url
      t.integer :pa

      t.timestamps null: false
    end
  end
end

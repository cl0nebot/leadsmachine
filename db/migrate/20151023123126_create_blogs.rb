class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :name
      t.string :slug
      t.text :content

      t.timestamps null: false
    end
    add_index :blogs, :slug, unique: true
  end
end

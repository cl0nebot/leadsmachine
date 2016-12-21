class CreateCitationSources < ActiveRecord::Migration
  def change
    create_table :citation_sources do |t|
      t.string :site
      t.string :submissionurl
      t.integer :da
      t.boolean :freesubmit

      t.timestamps null: false
    end
  end
end

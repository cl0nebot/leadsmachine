class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.string :street1
      t.string :street2
      t.string :city
      t.string :province
      t.string :postalcode
      t.string :phone
      t.string :googleplus
      t.string :facebook
      t.string :linkedin
      t.string :twitter
      t.string :shortdescription
      t.text :longdescription
      t.string :tags
      t.string :url
      t.string :citationemail
      t.string :businessemail
      t.string :login
      t.string :password
      t.string :timezone
      t.integer :prop_id
      t.string :prop_type

      t.timestamps null: false
    end
  end
end

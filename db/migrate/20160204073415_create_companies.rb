class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.references :user, index: true, foreign_key: true
      t.string :cname
      t.string :street1
      t.string :street2
      t.string :city
      t.references :province, index: true, foreign_key: true
      t.string :postalcode
      t.string :phone
      t.string :googleplus
      t.string :facebook
      t.string :linkedin
      t.string :twitter
      t.string :shortdescription
      t.string :longdescription
      t.string :tags
      t.string :citationemail
      t.string :businessemail
      t.string :login
      t.string :password
      t.string :timezone

      t.timestamps null: false
    end
  end
end

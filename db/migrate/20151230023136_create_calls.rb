class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.references :tracking_number, index: true, foreign_key: true
      t.string :sid
      t.string :parentcallsid
      t.string :datecreated
      t.string :datecreated
      t.string :dateupdated
      t.string :accountsid
      t.string :to
      t.string :from
      t.string :phonenumbersid
      t.string :providerstatus
      t.string :starttime
      t.string :endtime
      t.string :duration
      t.string :price
      t.string :priceunit
      t.string :direction
      t.string :answeredby
      t.string :forwardedfrom
      t.string :callername
      t.string :uri
      t.integer :lmstatus

      t.timestamps null: false
    end
  end
end

class ModifyCallModel < ActiveRecord::Migration
  def change
  	
  	add_column :calls, :callercity, :string
  	add_column :calls, :callerstate, :string
  	add_column :calls, :callercountry, :string
  	add_column :calls, :callstatus, :string
  	rename_column :calls, :phonenumbersid, :callsid
  	add_column :calls, :calledcity, :string
  	remove_column :calls, :parentcallsid, :string
    remove_column :calls, :datecreated, :string
		remove_column :calls, :dateupdated, :string		
		remove_column :calls, :sid, :string
		remove_column :calls, :starttime , :string
		remove_column :calls, :endtime , :string
		rename_column :calls, :duration , :callduration
		remove_column :calls, :price , :string
		remove_column :calls, :priceunit , :string
		remove_column :calls, :providerstatus , :string
		remove_column :calls, :answeredby , :string
		remove_column :calls, :forwardedfrom , :string
		remove_column :calls, :callername , :string
		remove_column :calls, :uri , :string

  end
end

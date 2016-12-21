class AddDestinationToTrackingNumbers < ActiveRecord::Migration
  def change
    add_column :tracking_numbers, :destination, :string
  end
end

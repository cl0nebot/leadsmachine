class TrackingNumber < ActiveRecord::Base
  belongs_to 	:machine
  has_many 		:calls

  enum status: [
  	:unknown,
  	:forwarding,
  	:unassigned,
  ]

  enum provider: [
  	:twilio,
  	:netaccess,
  ]

  validates_format_of :phone, with: /\+1\d{10}/, on: :create
  validates_format_of :destination, with: /\+1\d{10}/, on: :create
end

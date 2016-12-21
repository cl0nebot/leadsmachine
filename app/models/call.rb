class Call < ActiveRecord::Base
  belongs_to :tracking_number

  scope :completed,  ->{ where(callstatus: "completed")} 
  scope :incomplete, ->{ where.not.completed }

  enum lmstatus: [
  	:incomplete,
  	:short_call,
  	:unaudited,
  	:billable,
  	:nonbillable,
  	:disputed,
  	:billed
  ]

end


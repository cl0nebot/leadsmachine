class Company < ActiveRecord::Base
  belongs_to :user
  belongs_to :province
end

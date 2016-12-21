class Province < ActiveRecord::Base
	has_many :cities

	validates :abr, uniqueness: true
	validates :name, uniqueness: true
end

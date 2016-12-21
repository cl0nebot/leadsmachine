class Property < ActiveRecord::Base
	#belongs_to :prop, polymorphic: true
	belongs_to :machine
	
	has_many :citations
end

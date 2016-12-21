class Blacklist < ActiveRecord::Base
	validates_format_of :number, with: /\+1\d{10}/, on: :create
end



class City < ActiveRecord::Base
  belongs_to :province
  has_many :machines

  extend FriendlyId
	friendly_id :name, use: :slugged

	scope :withpop, ->{ where("population > ?", 0)} 
	scope :small, ->{ withpop.where("population < ?", 100000)} 
	scope :large, ->{ where("population >= ?", 100000)} 

	validates :name, uniqueness: true
end

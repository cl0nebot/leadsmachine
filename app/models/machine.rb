class Machine < ActiveRecord::Base
  
  belongs_to :category
  belongs_to :city
  belongs_to :province
  belongs_to :subcategory
  belongs_to :specialty
  belongs_to :user
  
  #has_many :properties, as: :prop
  has_many :properties
  
  #has_many :speclinks
  #has_many :subspecs, through: :speclinks
  has_many :tracking_numbers

  validates :category, presence: true
  validates :city, presence: true
  validates :province, presence: true
  validates :subcategory, presence: true
  validates :specialty, presence: true

  scope :available, ->{ where(user_id: nil) } 
  scope :sold, ->{ where.not(user_id: nil) } 
  #scope :master, ->{ joins (:speclinks) }
  #scope :slave, -> { available.where(id: Speclink.select(:subspec_id).uniq) }

  extend FriendlyId
    friendly_id :lmid, use: :slugged

  after_create do
    lmid =  (sprintf '%03d', self.specialty_id) + 
            (sprintf '%02d', self.province_id) +
            (sprintf '%02d', self.city_id) 
    self.update!(lmid: lmid)
  end

end

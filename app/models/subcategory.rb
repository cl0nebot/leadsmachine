class Subcategory < ActiveRecord::Base
  belongs_to 	:category
  has_many 		:specialties

  validates_uniqueness_of :name, :scope => [:category_id]
end

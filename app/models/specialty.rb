class Specialty < ActiveRecord::Base
  belongs_to :subcategory

  validates_uniqueness_of :name, :scope => [:subcategory_id]
end

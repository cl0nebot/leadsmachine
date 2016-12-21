class Citation < ActiveRecord::Base
  belongs_to :citation_source
  belongs_to :property
end

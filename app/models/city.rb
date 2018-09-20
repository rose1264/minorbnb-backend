class City < ActiveRecord::Base
  has_many :neighbourhoods
  has_many :listings, :through => :neighbourhoods
end

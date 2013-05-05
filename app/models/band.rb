class Band < ActiveRecord::Base
  attr_accessible :name
  
  has_many :songs
  has_many :setlists
  
  validates_uniqueness_of :name
end

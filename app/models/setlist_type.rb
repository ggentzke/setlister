class SetlistType < ActiveRecord::Base
  attr_accessible :name
  has_many :setlists
end

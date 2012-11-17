class Setlist < ActiveRecord::Base
	has_and_belongs_to_many :songs
  attr_accessible :duration, :name

end

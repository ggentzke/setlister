class Song < ActiveRecord::Base
	has_and_belongs_to_many :setlists
  attr_accessible :duration, :title
end
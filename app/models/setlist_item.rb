# Linking table: Songs -> Setlists
class SetlistItem < ActiveRecord::Base
  attr_accessible :order
  
  belongs_to :song
  belongs_to :setlist
end

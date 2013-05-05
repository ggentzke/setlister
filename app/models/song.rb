class Song < ActiveRecord::Base
  belongs_to :band
  has_many :setlist_items
	has_many :setlists, through: :setlist_items
  attr_accessible :id, :duration, :title, :key, :tuning, :bpm
  
  # Songs should be ordered by band until we have true band/user login scoping
  default_scope order('title ASC')

  validates_presence_of :title
  validates :duration, numericality: { greater_than_or_equal_to: 0 }
  
end
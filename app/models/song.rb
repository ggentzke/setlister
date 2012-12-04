class Song < ActiveRecord::Base
	has_and_belongs_to_many :setlists
  attr_accessible :duration, :title, :key, :tuning
  
  default_scope order('title ASC')

  validates_presence_of :title
  
  after_initialize :set_default_values
  
  private
  
    def set_default_values
      self.duration ||= 0
    end
  
end
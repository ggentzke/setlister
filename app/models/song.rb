class Song < ActiveRecord::Base
	has_and_belongs_to_many :setlists
  attr_accessible :duration, :title, :key, :tuning
  
  default_scope order('title ASC')

  validates_presence_of :title
  validate :valid_duration
  # validates :duration, numericality: { greater_than_or_equal_to: 0 }
  
  # before_save :examine_duration
  
  private
  
    def examine_duration
      if self.duration.present?
        if self.duration.is_a? Fixnum
          self.duration = 0 if self.duration < 0
        elsif self.duration.is_a?(Hash)
          temp = 0
          temp += self.duration[:min]*60 if self.duration.has_key?(:min)
          temp += self.duration[:sec] if self.duration.has_key?(:sec)
          self.duration = temp
        else
          self.duration = 0
        end
      end
    end
   
    def valid_duration
      if duration.is_a? Hash
        duration = 123
      end
    end
end
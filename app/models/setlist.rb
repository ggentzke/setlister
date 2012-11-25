class Setlist < ActiveRecord::Base
	has_and_belongs_to_many :songs
  attr_accessible :duration, :name

  before_save :ensure_duration

  def actual_duration
    self.songs.sum(&:duration)
  end

  def available_songs
    Song.all - self.songs
  end
  
  private
    def ensure_duration
      if self.duration.blank?
        self.duration = self.songs.sum(&:duration)
      end
    end
end

class Setlist < ActiveRecord::Base
	has_and_belongs_to_many :songs
  attr_accessible :duration, :name

  def actual_duration
    self.songs.sum(&:duration)
  end

  def available_songs
    Song.all - self.songs
  end
end

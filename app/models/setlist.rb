class Setlist < ActiveRecord::Base
  belongs_to :band
  has_many :setlist_items
	has_many :songs, through: :setlist_items
  attr_accessible :duration, :title

  before_save :ensure_duration

  TYPES = [ :CUSTOM, :GENERATED, :MODIFIED ]

  def actual_duration
    self.songs.sum(&:duration)
  end

  def available_songs
    Song.all - self.songs
  end
  
  # # Take song instances and assign order on insert.
  # def songs=(songs)
  #   current_order = self.songs.count - 1
  #   # begin
  #     self.songs.each do |song|
  #       if song.is_a? Song
  #         SetlistItem.create(setlist: self, song: song, order: current_order)
  #       else
  #         raise ArgumentError.new('Something other than a song was passed to creator')
  #       end
  #       current_order++
  #     end
  #     songs
  #   # rescue ArgumentError => ex
  #   #   raise ex
  #   # end
  # end
  
  private
    def ensure_duration
      if self.duration.blank?
        self.duration = self.songs.sum(&:duration)
      end
    end
end

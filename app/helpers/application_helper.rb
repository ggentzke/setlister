module ApplicationHelper
  
  def music_duration total_seconds
    duration_formatter = total_seconds >= 3600 ? '%H:%M:%S' : '%M:%S'
    Time.at(total_seconds).utc.strftime(duration_formatter)
  end
  
end

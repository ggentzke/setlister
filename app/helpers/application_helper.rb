module ApplicationHelper
  
  def music_duration total_seconds
    unless total_seconds > 3600
      Time.at(total_seconds).utc.strftime("%M:%S")
    else
      "Too damn long!"
    end
  end
  
end

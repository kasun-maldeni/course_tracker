module ApplicationHelper
  def local_time(datetime)
    datetime.in_time_zone('Melbourne').strftime('%d %b, %I:%M %p')
  end
end

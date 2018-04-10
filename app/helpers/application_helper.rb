module ApplicationHelper
  def website_name
    'Course Manager'
  end

  def local_time(datetime)
    datetime.in_time_zone('Melbourne').strftime('%a, %d %b')
  end

  def local_time_hours(datetime)
    datetime.in_time_zone('Melbourne').strftime('%a, %d %b %H:%M')
  end
end

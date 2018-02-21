module ApplicationHelper
  def website_name
    'Course Manager'
  end

  def local_time(datetime)
    datetime.in_time_zone('Melbourne').strftime('%a, %d %b')
  end
end

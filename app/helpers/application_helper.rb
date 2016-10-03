module ApplicationHelper
  def long_date(date)
    h date.strftime("%A %d %B %Y - %H:%M %p") rescue ''
  end

  # Produces -> 2009-01-26
  def medium_date(date)
    h date.strftime("%m/%d/%Y at %H:%M %p") rescue ''
  end

  # Produces -> 2009-01-26
  def short_date(date)
    h date.strftime("%Y-%m-%d") rescue ''
  end

end

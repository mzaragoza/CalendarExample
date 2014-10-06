class Event < ActiveRecord::Base

  def show_time
    self.from_date.strftime('%D').to_s + ' ' + self.from_time.strftime('%r').to_s + ' - ' +
    self.to_date.strftime('%D').to_s + ' ' + self.to_time.strftime('%r').to_s
  end
end


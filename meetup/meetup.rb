class Meetup
  def initialize(month, year)
    @month = month
    @year = year
    @day_ranges = {
      first: 1..7, #first seven days of the month
      second: 8..14, 
      third: 15..21,
      fourth: 22..28,
      teenth: 13..19 #13 to 19th days of the month
    }
  end

  def day(weekday, schedule)
    if schedule == :last
      last_day = Date.new(@year, @month, 1).next_month.prev_day.day
      days = (last_day - 6)..(last_day)
    else
      days = @day_ranges[schedule]
    end
    days_in_month = Date.new(@year, @month, days.first)..Date.new(@year, @month, days.last)
    #require 'pry'; binding.pry;
    the_day = days_in_month.detect{ |day| day.public_send(weekday.to_s + "?") }.day
    Date.new(@year, @month, the_day)
  end
end

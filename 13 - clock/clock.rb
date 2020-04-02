class Clock
  attr_reader :hour, :minute

  def initialize(hour: 0, minute: 0)
    @hour = hour
    @minute = minute
  end

  def hours(num)
    num*60*60
  end

  def minutes(num)
    num*60
  end

  def to_time
    # Creates a Time object with zero hours and zero minutes and adds hours and minutes to it.
    # Ruby Time adds and subtracts in seconds.
    Time.new(2000) + hours(@hour) + minutes(@minute)
  end

  def to_s
    to_time.strftime("%H:%M")
  end

  def +(clock)
    @hour += clock.hour
    @minute += clock.minute
    to_s
  end

  def -(clock)
    @hour -= clock.hour
    @minute -= clock.minute
    to_s
  end

  def ==(clock)
    self.to_s == clock.to_s
  end
end
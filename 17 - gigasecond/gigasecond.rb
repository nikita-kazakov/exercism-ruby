class Gigasecond
  def self.from(time)
    time + 1000000000
  end
end

#Solution #2 - Good if you plan on expanding this class. It can be instantiated.
class Gigasecond
  def initialize(time)
    @time = time
  end

  def self.from(time)
    new(time).from
  end

  def from
    @time + 1000000000
  end
end
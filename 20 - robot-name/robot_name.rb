require 'pry'
class Robot

  def name
    @name || name_generate
  end

  def name_generate
    @name = "#{random_letter}#{random_letter}#{random_number}#{random_number}#{random_number}"
  end

  def reset
    name_generate
  end

  def random_letter
    ('A'..'Z').to_a.sample
  end

  def random_number
    rand(1..9)
  end

  def to_s
    nil
  end

  def setup; Robot.forget; end
  def self.forget; end;
end

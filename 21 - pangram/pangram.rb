class Pangram
  def self.pangram?(sentence)
    (('a'..'z').to_a - sentence.downcase.scan(/[a-z]/)).empty?
  end
end

class Phrase

  def initialize(phrase)
    @phrase = phrase
    @collections = Hash.new(0)
  end

  def phrase_to_word_array
    @phrase.gsub(/[^\w]/," ")
            .chomp
            .split" "

  end

  def word_count
    phrase_to_word_array.each do |item|
      @collections[item] += 1
    end

    @collections
  end

end

#sample code
phrase = Phrase.new("word, bird, herd, word, 2, 4")
p phrase.word_count

phrase = "car: carpet as java: javascript!!&@$%^&"
phrase = phrase.gsub(/[^\w]/," ")
phrase = phrase.chomp
phrase = phrase.split(" ")

p phrase
puts "done"

class Acronym

  def self.abbreviate(phrase)
    phrase = phrase.sub("-", " ") #substitute any dashes to spaces.
    array = phrase.split(" ")
    acronym = ""
    array.each do |word|
      acronym << word[0].capitalize
    end
    p acronym #p is there so I can see the output of my code.
  end

end


#Sample Code (Will run only if launched from acronym.rb)
if __FILE__ == $0
  Acronym.abbreviate("Portable Network Graphics")
  Acronym.abbreviate('Ruby on Rails')
  Acronym.abbreviate('First In, First Out')
  Acronym.abbreviate('Complementary metal-oxide semiconductor')
end

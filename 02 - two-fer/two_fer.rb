class TwoFer

  #Putting in self.methodname makes it a CLASS method instead of an instance method.
  def self.two_fer(name = "you")
    "One for #{name}, one for me."
  end

end

#Sample Code
TwoFer.two_fer
TwoFer.two_fer("Bob")
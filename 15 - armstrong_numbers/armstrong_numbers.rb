class ArmstrongNumbers
  def self.include?(num)
    numbers = num.to_s.chars.map{|digit| digit.to_i}
    total = numbers.map{|number| number ** numbers.count}
    total.reduce{|sum, number| sum+= number} == num
  end
end
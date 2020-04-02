#THIS IS NOT FINISHED. TESTS NOT PASSING.

require 'pry'
class Luhn
  def self.valid?(input)
    return false if input.chars.count <= 1
    return false if input.chars.select{|char| char.is_a?(String)}.any?
    digits = input.scan(/[0-9]/)
    digits = digits.map{|digit| digit.to_i}

    reversed_digits = digits.reverse
    dig = []
    reversed_digits.each_with_index do |digit, index|
      if index.odd?
        doubled_digit = digit*2
        if doubled_digit > 9
          dig << (doubled_digit - 9)
        else
          dig << doubled_digit
        end
      else
        dig << digit
      end
    end

    sum = dig.reduce{|sum, num| sum += num}
    binding.pry
    if (sum / 10).even?
      true
    else
      false
    end
  end
end

Luhn.valid?("055 444 285")
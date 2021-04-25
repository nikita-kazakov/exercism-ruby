require 'pry'
class Fixnum
  def to_roman
    RomanNumeral.new(self).to_roman
  end
end

class RomanNumeral
  CONVERSION = {
      1000 => "M",
      500 => "D",
      100 => "C",
      50 => "L",
      10 => "X",
      5 => "V",
      1 => "I"
  }

  def initialize(num)
    @num = num
    @conversion = CONVERSION
    @roman_result = ""
  end


  def to_roman
    while @num > 0
      converter
    end
    convert_exceptions
    binding.pry
  end

  def convert_exceptions
    @roman_result.gsub!("IIII", "IV")
    @roman_result.gsub!("XXXX", "XL")
  end

  def converter
    pair = @conversion.detect{|digits, numeral| (@num - digits) >= 0}
    @roman_result << pair[1]
    @num -= pair[0]

    # @conversion.each do |digits, numeral|
    #   if (@num - digits) >= 0
    #     @roman_result << numeral
    #     @num -= digits
    #     @conversion = CONVERSION
    #     @conversion.select{|key, value| key == digits}
    #   end
    # end
  end
end

94.to_roman
# puts 'hi'
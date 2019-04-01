class Raindrops

  def self.convert(num)
    output_str = ""
    output_str += "Pling" if num.modulo(3) == 0
    output_str += "Plang" if num.modulo(5) == 0
    output_str += "Plong" if num.modulo(7) == 0
    output_str += num.to_s if output_str.empty?
    output_str
    end
end

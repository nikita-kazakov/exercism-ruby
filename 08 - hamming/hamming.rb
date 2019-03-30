
class Hamming

  def self.compute(first, second)
    final_count = 0
    raise ArgumentError if first.size != second.size
    0.upto(first.size - 1) do |count|
      if first[count] != second[count]
        final_count += 1
      end
    end
    final_count
  end

end

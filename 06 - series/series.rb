#Initial Solution
class Series
  def initialize(num_str)
    @num_str = num_str
  end

  def str_to_array
    @num_str.chars.map{|num| num.to_i}
  end

  def slices(amount)
    raise ArgumentError if amount > str_to_array.size
    sliced_arr = []
    str_to_array.each_cons(amount) do |slice|
      sliced_arr << slice.join.to_s
    end
    sliced_arr
  end
end

series = Series.new("01234")
p series.slices(3)
p "done"

=begin

#A much more elegant solution:
class Series
  def initialize(string)
    @string = string
  end

  def slices(n)
    raise ArgumentError if n > @string.length

    @string         # assuming n == 2 :
        .each_char    # ['s', 't', 'r', 'i', 'n', 'g']
        .each_cons(n) # [['s', 't'], ['r', 'i'], ['n', 'g']]
        .map(&:join)  # ['st', 'ri', ng']
  end
end


#Elegant Solution #2
class Series
  def initialize(string)
    @numbers = string.chars.map{|item| item.to_i}
  end

  def slices(slice)
    raise ArgumentError if slice > @numbers.length
    @numbers.each_cons(slice).to_a
  end
end

=end



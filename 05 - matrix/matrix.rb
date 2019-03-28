class Matrix

  def initialize(matrix_string)
    @matrix_string = matrix_string
  end

  def rows
    @matrix_string = @matrix_string.split("\n") #["1 2", "10 20"]
    @matrix_string.map do |index| #"1 2"
      index.split.map do |char| #selects each character
        char.to_i
      end
    end
  end

  def columns
    rows.transpose
  end

end

#sample code
if __FILE__ == $0
  matrix = Matrix.new("1 2\n10 20")
end

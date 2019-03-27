class HighScores

  def initialize(scores_array)
    @scores_array = scores_array
  end

  def scores
    @scores_array
  end

  def latest
    @scores_array.last
  end

  def personal_best
    @scores_array.max
  end

  def personal_top_three
    sorted_array = @scores_array.sort.reverse
    sorted_array_size = sorted_array.size

    if sorted_array_size >= 3
      sorted_array[0..2]
    else
      sorted_array[0..(sorted_array_size-1)]
    end

  end

end
#sample code
scores = [40,20,30,50]
HighScores.new(scores).scores
p HighScores.new(scores).personal_top_three

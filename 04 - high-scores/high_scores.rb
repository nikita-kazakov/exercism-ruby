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

    #You could have also made it less complicated by saying sorted_array.first(3).
    if sorted_array_size >= 3
      sorted_array[0..2]
    else
      sorted_array[0..(sorted_array_size-1)]
    end

  end

end

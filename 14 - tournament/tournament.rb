class Team
  attr_reader :name, :wins, :losses, :draws
  def initialize(name)
    @name = name
    @wins = 0
    @losses = 0
    @draws = 0
  end

  def win
    @wins += 1
  end

  def lose
    @losses += 1
  end

  def draw
    @draws += 1
  end

  def matches
    @wins + @losses + @draws
  end

  def points
    (@wins*3) + @draws
  end
end


class Tournament
  def initialize(input)
    @input = input
    @teams = []
  end

  def self.tally(input)
    new(input).run
  end

  def run
    collect_teams(@input)
    process_input(@input)
    report
  end

  def collect_teams(input)
    input.split("\n").each do |line|
      @teams << line.split(';')[0]
      @teams << line.split(';')[1]
    end
    @teams = @teams.uniq.map{|team| Team.new(team)}
  end

  def process_input(input)
    input.split("\n").each do |line|
      player, opponent, result = line.split(";")

      case result
      when "win"
        @teams.detect{|team| team.name == player}.win
        @teams.detect{|team| team.name == opponent}.lose
      when "loss"
        @teams.detect{|team| team.name == player}.lose
        @teams.detect{|team| team.name == opponent}.win
      when "draw"
        @teams.detect{|team| team.name == player}.draw
        @teams.detect{|team| team.name == opponent}.draw
      end
    end
  end

  def report
    puts "Team                             | MP |  W |  D |  L |  P"
    @teams.sort_by!{|team| team.points}.reverse!
    @teams.each do |team|
      puts "#{team.name.ljust(33)}|  #{team.matches} |  #{team.wins} |  #{team.draws} |  #{team.losses} |  #{team.points}"
    end
  end
end

# input = <<~INPUT
#     Allegoric Alaskans;Blithering Badgers;loss
#     Devastating Donkeys;Allegoric Alaskans;loss
#     Courageous Californians;Blithering Badgers;draw
#     Allegoric Alaskans;Courageous Californians;win
# INPUT
#
# expected = <<~TALLY
#     Team                           | MP |  W |  D |  L |  P
#     Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6
#     Blithering Badgers             |  2 |  1 |  1 |  0 |  4
#     Courageous Californians        |  2 |  0 |  1 |  1 |  1
#     Devastating Donkeys            |  1 |  0 |  0 |  1 |  0
# TALLY
# Tournament.tally(input)

# input = <<~INPUT
#     Blithering Badgers;Allegoric Alaskans;loss
# INPUT
#
# expected = <<~TALLY
#     Team                           | MP |  W |  D |  L |  P
#     Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3
#     Blithering Badgers             |  1 |  0 |  0 |  1 |  0
# TALLY
#
# Tournament.tally(input)


#
# input = <<~INPUT
#     Allegoric Alaskans;Blithering Badgers;win
#     Devastating Donkeys;Courageous Californians;draw
#     Devastating Donkeys;Allegoric Alaskans;win
#     Courageous Californians;Blithering Badgers;loss
#     Blithering Badgers;Devastating Donkeys;loss
#     Allegoric Alaskans;Courageous Californians;win
# INPUT
#
# expected = <<~TALLY
#     Team                           | MP |  W |  D |  L |  P
#     Devastating Donkeys            |  3 |  2 |  1 |  0 |  7
#     Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6
#     Blithering Badgers             |  3 |  1 |  0 |  2 |  3
#     Courageous Californians        |  3 |  0 |  1 |  2 |  1
# TALLY
#
# Tournament.tally(input)





#SOLUTION # 1:
# class Tournament
#   @@teams = Hash.new(0)
#
#   def self.tally(input)
#     setup_teams_hash(input)
#     process_input(input)
#     display
#   end
#
#   def self.process_input(input)
#     input.split("\n").each do |line|
#       values = line.split(";")
#       case values[2]
#       when "win"
#         @@teams[values[0]][:win] += 1
#         @@teams[values[0]][:points] += 3
#         @@teams[values[1]][:loss] += 1
#       when "loss"
#         @@teams[values[0]][:loss] += 1
#         @@teams[values[1]][:win] += 1
#         @@teams[values[1]][:points] += 3
#       when "draw"
#         @@teams[values[0]][:draw] += 1
#         @@teams[values[1]][:draw] += 1
#         @@teams[values[0]][:points] += 1
#         @@teams[values[1]][:points] += 1
#       end
#
#       @@teams[values[0]][:matches_played] += 1
#       @@teams[values[1]][:matches_played] += 1
#
#     end
#     @@teams = @@teams.sort_by{ |key, value| value[:points] }.reverse.to_h
#   end
#
#   def self.setup_teams_hash(input)
#     input.split("\n").each do |line|
#       @@teams[line.split(";").first] = {matches_played: 0, win: 0, draw: 0, loss: 0, points: 0}
#     end
#   end
#
#   def self.display
#     puts "Team                             | MP |  W |  D |  L |  P"
#     # @@teams.each do |key, value|
#     #   puts"#{key.ljust(31)}|  #{value[:matches_played]} |  #{value[:win]} |  #{value[:draw]} |  #{value[:loss]} |  #{value[:points]}"
#     # end
#   end
# end
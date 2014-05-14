module Glicko2
  DEFAULT_VOLATILITY = 0.06
  DEFAULT_GLICKO_RATING = 1500.0
  DEFAULT_GLICKO_RATING_DEVIATION = 350.0

  DEFAULT_CONFIG = {:volatility_change => 0.5}.freeze

  class DuplicatePlayerError < StandardError; end

  # Collection of helper methods
  class Util
    # Convert from a rank, where lower numbers win against higher numbers,
    # into Glicko scores where wins are `1`, draws are `0.5` and losses are `0`.
    #
    # @param [Integer] rank players rank
    # @param [Integer] other opponents rank
    # @return [Numeric] Glicko score
    def self.ranks_to_score(rank, other)
      case rank
      when 6
        1.0
      when 4
        0.7
      when 3
        0.5
      when 2
        0.3
      when 0
        0.0
      end
    end
  end
end

require "glicko2/version"
require "glicko2/normal_distribution"
require "glicko2/rating"
require "glicko2/player"
require "glicko2/rating_period"

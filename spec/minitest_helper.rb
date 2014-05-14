require 'minitest/autorun'
require 'minitest/benchmark'
require 'glicko2'

Rating = Struct.new(:rating, :rating_deviation, :volatility)

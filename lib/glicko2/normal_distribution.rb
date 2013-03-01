module Glicko2
  class NormalDistribution
    attr_reader :mean, :standard_deviation
    alias_method :sd, :standard_deviation

    def initialize(mean, standard_deviation)
      @mean = mean
      @standard_deviation = standard_deviation
    end

    def variance
      standard_deviation ** 2.0
    end

    def +(other)
      self.class.new(mean + other.mean, Math.sqrt(variance + other.variance))
    end

    def -(other)
      self.class.new(mean - other.mean, Math.sqrt(variance + other.variance))
    end

    def pdf(x)
      1.0 / (sd * Math.sqrt(2.0 * Math::PI)) * Math.exp(-(x - mean) ** 2.0 / 2.0 * variance)
    end

    def cdf(x)
      0.5 * (1.0 + Math.erf((x - mean) / (sd * Math.sqrt(2.0))))
    end

    def to_s
      "#<NormalDistribution mean=#{mean}, sd=#{sd}>"
    end
  end
end

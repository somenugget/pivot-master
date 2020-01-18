module Pivot
  class Item
    attr_reader :name, :assignee, :points

    AVAILABLE_PROJECT_CODES = %w[EREC AZR].freeze

    def initialize(name:, assignee:, points:)
      @name = name
      @assignee = assignee
      @points = points
    end

    def +(another_item)
      unless another_item.is_a? self.class
        raise ArgumentError("Please, use instance of #{self.class} to calculate sum.")
      end

      points + another_item.points
    end

    def project_code
      name.split('-').first
    end

    def valid?
      AVAILABLE_PROJECT_CODES.include? project_code
    end
  end
end

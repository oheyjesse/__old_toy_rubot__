module ToyRubot
  class Table
    attr_reader :size

    def initialize(x: 4, y: 4)
      @size = {
        x: x,
        y: y
      }
    end

    def set_size(x:, y:)
      new_size = {
        x: x,
        y: y
      }

      @size = new_size if input_checked?(new_size)
    end

    def in_bounds?(x:, y:)
      x_in_bounds = x >= 0 && x <= @size[:x]
      y_in_bounds = y >= 0 && y <= @size[:y]

      x_in_bounds && y_in_bounds
    end

    private def input_checked?(x:, y:)
      unless x.is_a?(Integer) && y.is_a?(Integer)
        raise ArgumentError, 'size must be an integer'
      end

      unless x >= 0 && y >= 0
        raise ArgumentError, 'size must be greater than 1'
      end

      true
    end
  end
end

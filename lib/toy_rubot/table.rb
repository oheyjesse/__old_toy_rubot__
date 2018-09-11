module ToyRubot
  class Table
    def initialize(x = 4, y = 4)
      @x = x
      @y = y
    end

    def size
      [@x, @y]
    end

    def set_size(x, y)
      unless x.is_a?(Integer) && y.is_a?(Integer)
        raise ArgumentError, 'size must be an integer'
      end

      unless x >= 0 && y >= 0
        raise ArgumentError, 'size must be greater than 1'
      end

      @x = x
      @y = y
      [@x, @y]
    end

    def in_bounds?(x, y)
      return true if x >= 0 && x <= @x
      return true if y >= 0 && y <= @y
      false
    end
  end
end

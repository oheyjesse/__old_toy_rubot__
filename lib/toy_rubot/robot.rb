module ToyRubot
  class Robot
    attr_reader :position, :facing
    attr_accessor :name

    def initialize(x:, y:, facing:, name: 'Ruby')
      @name = name
      @position = {
        x: x,
        y: y
      }
      @facing = facing
    end

    def move
      @position = calculate_next_position(@position)
    end

    def next_position
      calculate_next_position(@position)
    end

    def turn(direction)
      unless [:left, :right].include?(direction)
        raise ArgumentError, 'Invalid direction supplied'
      end

      compass = [:north, :east, :south, :west]
      facing_index = compass.index(@facing)

      case direction
      when :left then @facing = compass.rotate(1)[facing_index]
      when :right then @facing = compass.rotate(-1)[facing_index]
      end

      @facing
    end

    private # ---------------------------------------------------- // private

    def calculate_next_position(current_position)
      next_position = current_position.dup

      case @facing
      when :north then next_position[:y] += 1
      when :east then next_position[:x] += 1
      when :south then next_position[:y] -= 1
      when :west then next_position[:x] -= 1
      end

      next_position
    end
  end
end

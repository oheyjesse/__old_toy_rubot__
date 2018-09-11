require 'pry'

module ToyRubot
  class Robot
    attr_reader :position
    attr_accessor :name

    def initialize(x, y, facing, name='Ruby')
      @name = name
      @position = {
        x_pos: x,
        y_pos: y,
        facing: facing
      }
    end

    def move
      case @position[:facing]
      when :north then @position[:y_pos] += 1
      when :east then @position[:x_pos] += 1
      when :south then @position[:y_pos] -= 1
      when :west then @position[:x_pos] -= 1
      end

      @position
    end

    def turn(direction)
      unless [:left, :right].include?(direction)
        raise ArgumentError, 'Invalid direction supplied'
      end

      compass = [:north, :east, :south, :west]
      facing_index = compass.index(@position[:facing])

      case direction
      when :left then @position[:facing] = compass.rotate(1)[facing_index]
      when :right then @position[:facing] = compass.rotate(-1)[facing_index]
      end

      @position
    end


  end
end

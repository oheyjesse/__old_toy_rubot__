module ToyRubot
  class Game
    attr_reader :robot, :table

    def initialize
      @robot = nil
      @table = nil
    end

    def create_table(size = nil)
      @table = if size.nil?
                 Table.new
               else
                 Table.new(size)
               end
    end

    def create_robot(x:, y:, facing:, **args)
      raise 'table must be created before robot' unless @table
      raise 'robot not within bounds of table' unless @table.in_bounds?(x: x, y: y)

      @robot = Robot.new(x: x, y: y, facing: facing, **args)
    end

    def check_valid(x:, y:)
      @table.in_bounds?(x: x, y: y)
    end
  end
end

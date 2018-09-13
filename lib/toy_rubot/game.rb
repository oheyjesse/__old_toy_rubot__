module ToyRubot
  class Game
    attr_reader :robot, :table

    def initialize
      @robot = nil
      @table = nil
    end

    # args: {x: x, y: y} (optional)
    def create_table(**args)
      @table = Table.new(args)
    end

    def create_robot(x:, y:, facing:, **args)
      raise 'table must be created before robot' unless @table
      raise 'robot not in bounds of table' unless @table.in_bounds?(x: x, y: y)

      @robot = Robot.new(x: x, y: y, facing: facing, **args)
    end

    def check_valid(x:, y:)
      @table.in_bounds?(x: x, y: y)
    end
  end
end

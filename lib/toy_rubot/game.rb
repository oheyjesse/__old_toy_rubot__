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

    def update_table_size(size)
      @table.set_size(size)
    end

    def create_robot(**args)
      raise 'table must be created before robot' unless @table
      raise 'robot not within bounds of table' unless @table.in_bounds?(args)

      @robot = Robot.new(args)
    end

    def update_robot_name(name)
      @robot.name = name
    end
  end
end

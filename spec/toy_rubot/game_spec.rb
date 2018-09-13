RSpec.describe ToyRubot::Game do
  let(:game) { ToyRubot::Game.new }

  describe 'init' do
    it 'can instantiate an instance of Game' do
      expect(game).to be_an_instance_of(ToyRubot::Game)
    end
  end

  describe 'table related' do
    it 'can create a new table and place it with a size' do
      game.create_table(x: 2, y: 2)
      expect(game.table).to be_an_instance_of(ToyRubot::Table)
      expect(game.table.size).to eq(x: 2, y: 2)
    end

    it 'can create a new table and place it with no size' do
      game.create_table
      expect(game.table).to be_an_instance_of(ToyRubot::Table)
      expect(game.table.size).to eq(x: 4, y: 4)
    end

    it 'can update the table\'s size' do
      game.create_table(x: 2, y: 2)
      game.table.set_size(x: 10, y: 10)
      expect(game.table.size).to eq(x: 10, y: 10)
    end
  end

  describe 'robot creation and naming' do
    it 'can create a new robot at position with default name' do
      game.create_table
      game.create_robot(x: 2, y: 2, facing: :north)
      expect(game.robot).to be_an_instance_of(ToyRubot::Robot)
      expect(game.robot.position).to eq(x: 2, y: 2)
      expect(game.robot.facing).to eq(:north)
      expect(game.robot.name).to eq('Ruby')
    end

    it 'can create a new robot at position with given name' do
      game.create_table
      game.create_robot(x: 2, y: 2, facing: :north, name: 'Snoop Dogg')
      expect(game.robot).to be_an_instance_of(ToyRubot::Robot)
      expect(game.robot.position).to eq(x: 2, y: 2)
      expect(game.robot.facing).to eq(:north)
      expect(game.robot.name).to eq('Snoop Dogg')
    end

    it 'can update the robot\'s name' do
      game.create_table
      game.create_robot(x: 2, y: 2, facing: :north)
      game.robot.name = 'Snoop Lion'
      expect(game.robot.name).to eq('Snoop Lion')
    end

    it 'raises an error if no table is created' do
      expect { game.create_robot(x: 2, y: 2, facing: :north) }
        .to raise_error(RuntimeError)
    end

    it 'raises an error if placed out of bounds' do
      game.create_table
      expect { game.create_robot(x: 15, y: 15, facing: :north) }
        .to raise_error(RuntimeError)
    end
  end

  describe 'check_valid' do
    it 'returns true if coordinates in range' do
      game.create_table
      expect(game.check_valid(x: 3, y: 3)).to be(true)
    end

    it 'returns false if coordinates out of range' do
      game.create_table
      expect(game.check_valid(x: 15, y: 15)).to be(false)
    end

    it 'returns false if x coordinate out of range' do
      game.create_table
      expect(game.check_valid(x: 15, y: 3)).to be(false)
    end

    it 'returns false if y coordinate out of range' do
      game.create_table
      expect(game.check_valid(x: 3, y: 15)).to be(false)
    end

    it 'can get and pass the next robot move if valid' do
      game.create_table
      game.create_robot(x: 2, y: 2, facing: :north)
      expect(game.check_valid(game.robot.next_position)).to be(true)
    end

    it 'returns false if north on north edge' do
      game.create_table
      game.create_robot(x: 4, y: 4, facing: :north)
      expect(game.check_valid(game.robot.next_position)).to be(false)
    end

    it 'returns false if east on east edge' do
      game.create_table
      game.create_robot(x: 4, y: 4, facing: :east)
      expect(game.check_valid(game.robot.next_position)).to be(false)
    end

    it 'returns false if south on south edge' do
      game.create_table
      game.create_robot(x: 0, y: 0, facing: :south)
      expect(game.check_valid(game.robot.next_position)).to be(false)
    end

    it 'returns false if west on west edge' do
      game.create_table
      game.create_robot(x: 0, y: 0, facing: :west)
      expect(game.check_valid(game.robot.next_position)).to be(false)
    end
  end
end

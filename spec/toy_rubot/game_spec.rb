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
      game.update_table_size(x: 10, y: 10)
      expect(game.table.size).to eq(x: 10, y: 10)
    end
  end

  describe 'robot placement and naming' do
    it 'can create a new robot and place it with default name' do
      game.place_robot(x: 2, y: 2, facing: :north)
      expect(game.robot).to be_an_instance_of(ToyRubot::Robot)
      expect(game.robot.position).to eq(x: 2, y: 2)
      expect(game.robot.facing).to eq(:north)
      expect(game.robot.name).to eq('Ruby')
    end

    it 'can create a new robot and place it with given name' do
      game.place_robot(x: 2, y: 2, facing: :north, name: 'Snoop Dogg')
      expect(game.robot).to be_an_instance_of(ToyRubot::Robot)
      expect(game.robot.position).to eq(x: 2, y: 2)
      expect(game.robot.facing).to eq(:north)
      expect(game.robot.name).to eq('Snoop Dogg')
    end

    it 'can update the robot\'s name' do
      game.place_robot(x: 2, y: 2, facing: :north)
      game.update_robot_name('Snoop Lion')
      expect(game.robot.name).to eq('Snoop Lion')
    end
  end

end

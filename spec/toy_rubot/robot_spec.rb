RSpec.describe ToyRubot::Robot do
  let(:robot) { ToyRubot::Robot.new(0, 0, :north) }

  describe 'init' do
    it 'can instantiate an instance of Robot' do
      expect(robot).to be_an_instance_of(ToyRubot::Robot)
    end
  end

  describe 'name' do
    it 'has a default name if none supplied' do
      robot = ToyRubot::Robot.new(0, 0, :north)
      expect(robot.name).to eq('Ruby')
    end

    it 'can change it\'s name' do
      robot.name = 'The Robot Formerly Known As Ruby'
      expect(robot.name).to eq('The Robot Formerly Known As Ruby')
    end
  end

  describe 'position / move' do
    it 'can return it\'s position' do
      expect(robot.position).to eq(x_pos: 0, y_pos: 0, facing: :north)
    end

    it 'can move forward' do
      robot.move
      expect(robot.position[:facing]).to eq(:north)
    end
  end

  describe 'turning' do
    it 'can turn left' do
      robot.turn(:left)
      expect(robot.position[:facing]).to eq(:east)
    end

    it 'can turn right' do
      robot.turn(:right)
      expect(robot.position[:facing]).to eq(:west)
    end

    it 'can turn to the left 180 degrees' do
      robot.turn(:left)
      robot.turn(:left)
      expect(robot.position[:facing]).to eq(:south)
    end

    it 'can turn to the right a full 360 degrees' do
      robot.turn(:right)
      robot.turn(:right)
      robot.turn(:right)
      robot.turn(:right)
      expect(robot.position[:facing]).to eq(:north)
    end
  end
end

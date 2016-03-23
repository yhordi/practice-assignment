require 'minitest/autorun'
require 'minitest/pride'
require_relative 'review_assignment'
require 'faker'

describe Building do
  before do
    i = 1
    @building = Building.new(floors: 3, material: 'concrete', paint: 'green', id: i)
    i += 1
  end

  # release 0
  describe 'Attributes' do
    it 'has a floors attribute that can be read' do
      @building.floors.must_equal 3
    end
    it 'has a paint attribute that can be read' do
      @building.paint.must_equal 'green'
    end
    it 'has a paint attribute that can be written' do
      @building.paint = "blue"
      @building.paint.must_equal 'blue'
    end
  end
  # Release 1
  describe 'Location' do
    it 'is located in Seattle' do
      Building::LOCATION.must_equal 'Seattle'
    end
  end
  # Release 2
  describe 'Building.all' do
    it 'returns a collection of all buildings' do
      Building.all.must_include @building
    end
  end
  describe 'Building.paint_all' do
    it 'changes every buildings paint' do
      Building.paint_all('red')
      Building.all.each do |building|
        building.paint.must_equal('red')
      end
    end
  end
  describe '#occupants' do
    it 'has an accessible occupants array' do
      @building.occupants.must_equal []
    end
  end
  describe '#add_occupant' do
    it 'can add an occupant to a building' do
      @building.add_occupant({name: 'Jaleen Davis', age: 38}).must_equal [{name: 'Jaleen Davis', age: 38}]
    end
  end
  describe '#average_age' do
    it 'returns the average age of all occupants in a building' do
      @building.add_occupant({name: 'Joe Warren', age: 24})
      @building.add_occupant({name: 'Janessa Van Dyne', age: 48})
      @building.average_age.must_equal 36
    end
  end
end

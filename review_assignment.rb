# This assignment will go over what we talked about yesterday
# The assignment is to make a class that will follow the following specifications:
# - It uses instance variables
# - It uses at least one class variable and one constant
# - it utilizes class and instance methods
# - it utilizes attr methods correctly
# - Commit and push after each release and do a pull request. Once you do that I'll give you a code review and feedback
# - I'd like for this to be done by Monday morning. Don't worry too much if you can't finish
# but do as much as you can.
# - if anything is unclear please email me and I'll clarify

# Release 0: Make a class called Building it should have attributes which
# store info about it's construction. look at review_assignment_spec.rb for specifics

# Release 1: The building has a location of Seattle.
# All buildings in this class will be in Seattle.
# This will not change.

# Release 2: The building class has a collection of all buildings created thus far.
# First build the collection, then build a method that will return the collection.

# Release 3: write a method that will change the color of each building in the collection you built in the previous release.

# Release 4: People are now ready to move into your buildings. Make an accessible attribute that will return a collection of occupants.
# Build a method for adding an occupant to a building. Occupants should be illustrated using a hash like the one below
# {name: 'Jaleen Davis', age: 38}

# Release 5: Build a method that returns the average age of the occupants of a building

# Bonus Release: Build a method that returns the average age of the occupants of every building
class Building
  LOCATION = 'Seattle'
  attr_reader :floors, :occupants
  attr_accessor :paint
  @@all = []

  def initialize(options = {})
    @floors = options[:floors]
    @paint = options[:paint]
    @@all << self
    @occupants = []
  end

  def self.all
    @@all
  end

  def self.paint_all(color)
    @@all.map do |building|
      building.paint = color
    end
  end

  def add_occupant(occupant)
    @occupants << occupant
  end

  def average_age
    ages = []
    @occupants.each do |occupant|
      ages << occupant[:age]
    end
    total = ages.reduce(:+)
    total / @occupants.length
  end

end

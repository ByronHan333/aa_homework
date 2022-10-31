class Animal
  attr_reader :species

  def initialize(species)
    @species = species
  end
end

class Human < Animal
  attr_reader :name

  def initialize(name)
    @name = name
    super('')
  end
end

h = Human.new("jack")
p h
p h.species

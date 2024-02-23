class Library
  attr_reader :name, :authors

  def initialize(name)
    @name = name
    @authors = []
  end
end
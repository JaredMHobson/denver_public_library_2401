class Author
  attr_reader :books
  
  def initialize(details)
    @first_name = details[:first_name]
    @last_name = details[:last_name]
    @books = []
  end

  def name
    @first_name + " " + @last_name
  end
end
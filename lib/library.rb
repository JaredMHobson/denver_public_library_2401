class Library
  attr_reader :name, :authors, :books

  def initialize(name)
    @name = name
    @authors = []
    @books = []
  end

  def add_author(author)
    @authors << author
    add_authors_books(author)
  end

  def add_authors_books(author)
    author.books.each do |book|
      @books << book
    end
  end

  def publication_time_frame(author)
    author.publication_time_frame
  end
end
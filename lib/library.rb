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

  def checkout(book)
    if @books.include?(book) && !book.checked_out?
      return book.checkout
    elsif !@books.include?(book)
      return false
    else
      !book.checked_out?
    end
  end

  def checked_out_books
    @books.select do |book|
      book.checked_out?
    end
  end

  def return(book)
    book.return
  end

  def most_popular_book
    @books.max_by do |book|
      book.times_checked_out
    end
  end

  def inventory
    authors_and_books = {}
    @authors.each do |author|
      authors_and_books[author] = author.books
    end
    authors_and_books
  end
end
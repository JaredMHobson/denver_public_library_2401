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

  def write(book_title, pub_date)
    book = Book.new(
      {
      title: book_title, 
      publication_date: pub_date,
      author_first_name: @first_name,
      author_last_name: @last_name
    }
    )
    @books << book
    book
  end
end
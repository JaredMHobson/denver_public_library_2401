class Book
  attr_reader :title

  def initialize(details)
    @title = details[:title]
    @first_name = details[:author_first_name]
    @last_name = details[:author_last_name]
    @publication_date = details[:publication_date]
  end

  def publication_year
    @publication_date[-4..-1]
  end

  def author
    @first_name + " " + @last_name
  end
end
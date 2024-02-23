class Book
  attr_reader :title, :author

  def initialize(details)
    @title = details[:title]
    @author = details[:author]
    @publication_date = details[:publication_date]
  end
end
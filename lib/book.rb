class Book
  attr_reader :title, :times_checked_out

  def initialize(details)
    @title = details[:title]
    @first_name = details[:author_first_name]
    @last_name = details[:author_last_name]
    @publication_date = details[:publication_date]
    @checked_out = false
    @times_checked_out = 0
  end

  def publication_year
    @publication_date[-4..-1]
  end

  def author
    @first_name + " " + @last_name
  end

  def checkout
    @times_checked_out += 1
    @checked_out = true
  end

  def return
    @checked_out = false
  end

  def checked_out?
    @checked_out
  end
end
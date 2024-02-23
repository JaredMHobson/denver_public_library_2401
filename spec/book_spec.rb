require './lib/book'

RSpec.describe 'Book' do
  let (:book) { Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"}) }

  describe '#initialize' do
    it 'exists' do
      expect(book).to be_instance_of(Book)
    end

    it 'has a title' do
      expect(book.title).to eq("To Kill a Mockingbird")
    end

    it 'has an author' do
      expect(book.author).to eq("Harper Lee")
    end
  end
end
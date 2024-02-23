require './lib/book'

RSpec.describe 'Book' do
  let (:book) { Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"}) }

  describe '#initialize' do
    it 'exists' do
      expect(book).to be_instance_of(Book)
    end
  end
end
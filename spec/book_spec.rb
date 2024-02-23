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

    it 'has an author and can show their full name' do
      expect(book.author).to eq("Harper Lee")
    end

    it 'has a publication date and can show its year' do
      expect(book.publication_year).to eq("1960")
    end

    it 'is not checked out by default' do
      expect(book.checked_out?).to be false
    end
  end

  describe '#checked_out?' do
    describe '#checkout' do
      it 'can be checked out' do 
        expect(book.checked_out?).to be false

        book.checkout

        expect(book.checked_out?).to be true
      end
    end

    describe '#return' do
      it 'can be returned' do
        book.checkout

        expect(book.checked_out?).to be true

        book.return

        expect(book.checked_out?).to be false
      end
    end
  end
end
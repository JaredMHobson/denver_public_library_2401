require './lib/book'
require './lib/author'
require './lib/library'

RSpec.describe 'Library' do
  let (:book) { Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"}) }
  let (:charlotte_bronte) { Author.new({first_name: "Charlotte", last_name: "Bronte"}) }
  let (:harper_lee) { Author.new({first_name: "Harper", last_name: "Lee"}) }
  let (:dpl) { Library.new("Denver Public Library") }

  describe '#initialize' do
    it 'exists' do
      expect(dpl).to be_instance_of(Library)
    end

    it 'has a name' do
      expect(dpl.name).to eq("Denver Public Library")
    end

    it 'has no authors by default' do
      expect(dpl.authors).to be_empty
    end

    it 'has no books by default' do
      expect(dpl.books).to be_empty
    end
  end

  describe '#add_author' do
    it 'can add authors to its authors array' do
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      villette = charlotte_bronte.write("Villette", "1853")
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

      dpl.add_author(charlotte_bronte)

      expect(dpl.authors).to eq([charlotte_bronte])

      dpl.add_author(harper_lee)

      expect(dpl.authors).to eq([charlotte_bronte, harper_lee])
    end
  end

  describe '#books' do
    it 'can list all books by all authors added to the library' do
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      villette = charlotte_bronte.write("Villette", "1853")
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
      
      dpl.add_author(charlotte_bronte)
      
      expect(dpl.books).to eq([jane_eyre, professor, villette])
      
      dpl.add_author(harper_lee)
      
      expect(dpl.books).to eq([jane_eyre, professor, villette, mockingbird])
    end
  end

  describe '#add_authors_books' do
    it 'can add books from an author to the books array' do
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
      
      dpl.add_authors_books(charlotte_bronte)
      
      expect(dpl.books).to eq([jane_eyre, professor])

      dpl.add_authors_books(harper_lee)

      expect(dpl.books).to eq([jane_eyre, professor, mockingbird])
    end
  end

  describe '#publication_time_frame' do
    it 'can return the year of the book with the earliest publication year and the latest' do
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      villette = charlotte_bronte.write("Villette", "1853")

      dpl.add_author(charlotte_bronte)

      time_frame = dpl.publication_time_frame(charlotte_bronte)

      expect(time_frame).to eq({start: "1847", end: "1853"})

      professor = charlotte_bronte.write("The Professor", "1857")

      new_time_frame = dpl.publication_time_frame(charlotte_bronte)

      expect(new_time_frame).to eq({start: "1847", end: "1857"})
    end
  end

  describe '#checkout' do
    it 'can checkout a book' do
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      dpl.add_author(charlotte_bronte)

      expect(jane_eyre.checked_out?).to be false

      dpl.checkout(jane_eyre)

      expect(jane_eyre.checked_out?).to be true
    end

    it 'can return false if a book is checked out or does not exist in the library' do
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

      expect(dpl.checkout(jane_eyre)).to be false
      
      dpl.add_author(charlotte_bronte)
      
      expect(dpl.checkout(jane_eyre)).to be true

      expect(dpl.checkout(jane_eyre)).to be false
    end
  end

  describe '#checked_out_books' do
    it 'can return an array of all checked out books' do
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      villette = charlotte_bronte.write("Villette", "1853")
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
      
      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)

      expect(dpl.checked_out_books).to be_empty

      dpl.checkout(jane_eyre)
      dpl.checkout(professor)

      expect(dpl.checked_out_books).to eq([jane_eyre, professor])

      dpl.checkout(villette)
      dpl.checkout(mockingbird)

      expect(dpl.checked_out_books).to eq([jane_eyre, professor, villette, mockingbird])
    end
  end

  describe '#return' do
    it 'can checkout a book' do
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      dpl.add_author(charlotte_bronte)
      dpl.checkout(jane_eyre)

      expect(jane_eyre.checked_out?).to be true

      dpl.return(jane_eyre)

      expect(jane_eyre.checked_out?).to be false
    end
  end
end
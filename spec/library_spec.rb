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
end
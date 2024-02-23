require './lib/book'
require './lib/author'

RSpec.describe 'Author' do
  let (:book) { Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"}) }
  let (:charlotte_bronte) { Author.new({first_name: "Charlotte", last_name: "Bronte"}) }

  describe '#initialize' do
    it 'exists' do
      expect(charlotte_bronte).to be_instance_of(Author)
    end

    it 'has a full name' do
      expect(charlotte_bronte.name).to eq("Charlotte Bronte")
    end

    it 'has no books by default' do
      expect(charlotte_bronte.books).to be_empty
    end
  end

  describe '#write' do
    it 'can add new books to its array of books' do
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

      expect(charlotte_bronte.books).to eq([jane_eyre])

      villette = charlotte_bronte.write("Villette", "1853")

      expect(charlotte_bronte.books).to eq([jane_eyre, villette])
    end
  end

  describe '#publication_time_frame' do
    it 'can return a hash showing the year of its earliest book and its latest book' do
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      villette = charlotte_bronte.write("Villette", "1853")

      expect(charlotte_bronte.publication_time_frame).to eq({start: "1847", end: "1853"})

      professor = charlotte_bronte.write("The Professor", "1857")

      expect(charlotte_bronte.publication_time_frame).to eq({start: "1847", end: "1857"})
    end

    it 'can return its earliest book' do
      villette = charlotte_bronte.write("Villette", "1853")

      expect(charlotte_bronte.earliest_book).to eq(villette)

      professor = charlotte_bronte.write("The Professor", "1857")

      expect(charlotte_bronte.earliest_book).to eq(villette)

      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

      expect(charlotte_bronte.earliest_book).to eq(jane_eyre)
    end

    it 'can return its latest book' do
      villette = charlotte_bronte.write("Villette", "1853")

      expect(charlotte_bronte.latest_book).to eq(villette)

      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

      expect(charlotte_bronte.latest_book).to eq(villette)

      professor = charlotte_bronte.write("The Professor", "1857")

      expect(charlotte_bronte.latest_book).to eq(professor)
    end
  end
end
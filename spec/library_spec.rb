require './lib/book'
require './lib/author'
require './lib/library'

RSpec.describe 'Library' do
  let (:book) { Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"}) }
  let (:charlotte_bronte) { Author.new({first_name: "Charlotte", last_name: "Bronte"}) }
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
  end
end
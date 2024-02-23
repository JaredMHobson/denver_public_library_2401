require './lib/book'
require './lib/author'

RSpec.describe 'Author' do
  let (:book) { Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"}) }
  let (:charlotte_bronte) { Author.new({first_name: "Charlotte", last_name: "Bronte"}) }

  describe '#initialize' do
    it 'exists' do
      expect(charlotte_bronte).to be_instance_of(Author)
    end
  end
end
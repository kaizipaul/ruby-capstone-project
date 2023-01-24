require_relative '../genre'

describe 'Unit Tests for Genre Class' do
  before :each do
    @genre = Genre.new('MyGenre', '2000/01/01')
  end

  context 'initialize object' do
    it 'should be an instance of Genre' do
      expect(@genre).to be_instance_of Genre
    end

    it 'should not be an instance of Item' do
      expect(@genre).not_to be_instance_of Item
    end

    it 'should be a kind of Item' do
      expect(@genre).to be_kind_of Item
    end
  end

  context 'genre' do
    it 'should be "2005/06/25"' do
      expect(@genre.publish_date).to eq('2000/01/01')
    end
  end
end

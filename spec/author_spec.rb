require_relative '../author'

describe 'Unit testing for Author Class' do
  before :each do
    @author = Author.new('Oluwatoyin', 'Olaoye')
  end

  context 'initialize object' do
    it 'should be an instance of Author' do
      expect(@author).to be_instance_of Author
    end

    it 'should not be an instance of Item' do
      expect(@author).not_to be_instance_of Item
    end

    it 'should be a kind of Item' do
      expect(@author).to be_kind_of Item
    end
  end

  context 'First name of author' do
    it 'should be "Oluwatoyin"' do
      expect(@author.first_name).to eql 'Oluwatoyin'
    end
  end

  context 'Last name of author' do
    it 'should be "Olaoye"' do
      expect(@author.last_name).to eql 'Olaoye'
    end
  end
end

require_relative '../src/label'

describe 'Unit testing for Label Class' do
  before :each do
    @label = Label.new('Gift', 'Red')
  end

  context 'initialize object' do
    it 'should be an instance of Label' do
      expect(@label).to be_instance_of Label
    end

    it 'should not be an instance of Item' do
      expect(@label).not_to be_instance_of Item
    end

    it 'should be a kind of Item' do
      expect(@label).to be_kind_of Item
    end
  end

  context 'Label title' do
    it 'should be "Gift"' do
      expect(@label.title).to eql 'Gift'
    end
  end

  context 'Label Color' do
    it 'should be "Red"' do
      expect(@label.color).to eql 'Red'
    end
  end
end

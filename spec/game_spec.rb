require_relative '../game'

describe 'Unit testing for Game Class' do
  before :each do
    @game = Game.new('Y', '1994/08/01', '2010/02/05')
  end

  context 'initialize object' do
    it 'is an instance of Game' do
      expect(@game).to be_instance_of Game
    end

    it 'is not an instance of Item' do
      expect(@game).not_to be_instance_of Item
    end

    it 'should be a kind of Item' do
      expect(@game).to be_kind_of Item
    end
  end

  context 'Multiplayer Game' do
    it 'should be "Y"' do
      expect(@game.multiplayer).to eql 'Y'
    end
  end

  context 'when was game last played' do
    it 'should be "1994/08/01"' do
      expect(@game.last_played_at).to eql '1994/08/01'
    end

    context 'when was game published' do
      it 'should be "2010/02/05"' do
        expect(@game.publish_date).to eql '2010/02/05'
      end
    end
  end
end

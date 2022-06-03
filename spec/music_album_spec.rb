require './music_album'
require './item'

describe MusicAlbum do
  before :each do
    @music_album = MusicAlbum.new('22-02-2010', true)
  end

  context '#new' do
    it 'should takes one parameters and returns a music album object' do
      expect(@music_album.instance_of?(MusicAlbum)) == true
    end
  end

  context 'method test' do
    it 'can_be_archieved should return true' do
      expect(@music_album.can_be_archived?).to be true
    end
  end
end

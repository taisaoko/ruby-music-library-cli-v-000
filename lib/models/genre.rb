class Genre
  attr_accessor :name, :songs

  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods
  
  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    song.genre = self if song.genre.nil?
    self.songs << song unless self.songs.include?(song)
  end

  def artists # it has many through
    @songs.collect {|song| song.artist}.uniq
  end
end
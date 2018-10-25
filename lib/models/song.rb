class Song
  attr_accessor :name
  attr_reader :artist, :genre
  
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    # Assign that genre to myself
    @genre = genre
    # Be a nice object and tell the genre that it has a new song, me.
    genre.add_song(self)
  end
  
  # def genre=(genre) The last definition always takes precedence
  #   raise "STOP"
  # end
  
  

end
class Genre

  attr_accessor :name, :songs

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def add_song(song_name)
    song = song_name
    if song.genre == nil
      song.genre = self
    end
    @songs << song unless @songs.include?(song)
  end

  def artists
    self.songs.map do |song|
      song.artist
    end.uniq
  end

end

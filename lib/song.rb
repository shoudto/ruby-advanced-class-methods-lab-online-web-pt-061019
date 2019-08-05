require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song =  self.new
    song.save
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  # filename =>  "Thundercat - For Love I Come.mp3"
  def self.new_from_filename(filename)
    filename = filename.split(" - ")
    song_name = filename[1].gsub(".mp3", "")
    artist_name = filename[0]
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  # filename => "Thundercat - For Love I Come.mp3"
  def self.create_from_filename(filename)
     filename =  filename.split(" - ")
     song_name = filename[1].gsub(".mp3", "")
     artist_name = filename[0]
     song = self.create
     song.name = song_name
     song.artist_name = artist_name
     song
  end

  def self.destroy_all
    @@all.clear 
  end

end

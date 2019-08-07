require "pry"

class Song
  attr_accessor :name, :artist_name, :file_format
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    @@all.find{|item| item.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{|obj| obj.name}
  end

  def self.new_from_filename(string)
    delimiters = [" - ", ".mp3"]
    array = string.split(Regexp.union(delimiters))      #########
    name = array[1]
    artist = array[0]
    new_song = self.new
    new_song.name = name
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(string)
    new_song = self.new_from_filename(string)
    @@all << new_song
  end

  def self.destroy_all
    self.all.clear
  end
  
  #binding.pry
  #0
end

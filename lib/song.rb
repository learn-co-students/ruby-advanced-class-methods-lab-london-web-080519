#require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end


  def initialize(name = nil, artist_name = nil)
    @name = name
    @artist_name = artist_name
    @@all << self
  end

  def self.new_by_name(name)
    Song.new(name)
  end

  def self.create_by_name(name)
    Song.new(name)
  end

  def self.create
   Song.new
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
   # @@all.sort
    #@@all.fetch {|song| song.name}
    Song.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    #array = file_name.split(' - ')
    #arry_no_mp3 = array[1].split('.')
    splitted_filename = file_name.split(/[-.]/)
    artist_name = splitted_filename[0].strip
    name = splitted_filename[1].strip
    Song.new(name, artist_name)
  end

  def self.create_from_filename(file_name)
      Song.new_from_filename(file_name)
  end

  def self.destroy_all
    @@all.clear
  end


end

#song = Song.create
#song1 = Song.create_by_name("songy")
#Song.all.include?(song)
#song = Song.create_by_name("tuney")

#song2 = Song.new_from_filename)song - hello.mp3

#binding.pry
#0

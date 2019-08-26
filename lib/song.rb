require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize(name)
  #   @name = name
  # end

  def self.all
    @@all
  end

  def save
    self.class.all << self
    # Song.all << self
  end

  def self.create
    # create new instance
    song = self.new
    # add to class variable
    @@all << song
    # return the instance 
    song
  end

  def self.new_by_name(name)
    # create new instance with song
    song = self.new
    song.name = name
    # return the new instance
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end


    # self.find_by_name(name) || self.create_by_name(name)

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name) || self.create_by_name(name) 
    song
  end
     

  def self.alphabetical
    # sort all song  by using sort_by
    self.all.sort_by{|song| song.name}
  
  end

  def self.new_from_filename(file_name)
    
      # Split the row into 2 parts, name and artist_name, at the "-"
      data = file_name.split(" - ")
     
      artist_name = data[0]
      name = data[1].sub(/\.[^.]+\z/,'')
      # the regex, it matches: 
      # \. - a dot    
      # [^.]+ - one or more characters other than a dot
      # \z - end of string.
      
      # Make a new instance
      song = self.new # self refers to the Song class. This is Song.new
      # Set the properties on the Song.
      song.name = name
      song.artist_name = artist_name
      
      # Return the Song instance
      song 

  end

  def self.create_from_filename(file_name)
    self.all << self.new_from_filename(file_name)
  end

  def self.destroy_all
    self.all.clear
  end

end

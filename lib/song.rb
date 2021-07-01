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
    song = self.new_by_name(name)
    song.save
    # song = self.create         *Alternate code to get same result*
    # song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    # self.find_by_name(name) || self.create_by_name(name)      *Alternate code to get same result*
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort{|a, b| a.name <=> b.name}
    # @@all.sort{|song| song.name}       *Alternate code to get same result*
  end

  def self.new_from_filename(file_name)
    split_file = file_name.chomp(".mp3").split(" - ")
    song = self.new
    song.name = split_file[1]
    song.artist_name = split_file[0]
    song
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
    song
  end

  def self.destroy_all
    @@all = []
    # @@all.clear      *Alternate code to get same result*
  end
  

end

# binding.pry
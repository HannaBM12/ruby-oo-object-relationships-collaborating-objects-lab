require 'pry'

class Song 

    @@all = []
    attr_accessor :artist, :name

    def initialize (name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        song_name = filename.split(" - ")[1]
        song = self.new(song_name)
        song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
        song
    end

    def artist_name(name)
        artist_inst = Artist.find_or_create_by_name(name)
        self.artist = artist_inst.name
    end
end
require 'pry'

class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
        @songs = []
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
        @songs << song
    end 

    def self.find_or_create_by_name(name)
        all_artist = self.all.map{|artist| artist.name}
        
        if all_artist.include?(name)
            self.all.find{|artist| artist.name == name}

        else
            Artist.new(name)
            
        end
       
    end

    def print_songs
        self.songs.each{|song_inst| puts "#{song_inst.name}"}
    end

end

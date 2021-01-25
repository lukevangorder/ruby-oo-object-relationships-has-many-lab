require 'pry'
class Artist
    attr_accessor :name
    @@songs = 0
    def initialize(name)
        @name = name
        @songs = []
    end
    def songs
        Song.all.each do |song|
            if song.artist_name == self.name
                @songs.push(song)
            end
        end
        @songs
    end
    def add_song(song)
        song.artist = self
        @@songs += 1
    end
    def add_song_by_name(song_name)
        new_song = Song.new(song_name)
        new_song.artist = self
        @@songs += 1
    end
    def self.song_count
        return Song.all.length
    end
end

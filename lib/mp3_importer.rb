require 'pry'
class MP3Importer
    attr_reader :path

    def initialize(path)
        @path = path
    end

    def files
       file_path = Dir.glob(self.path+"/*").map {|file| file.split("/").last}
    end

    def import
        self.files.each{ |filename| Song.new_by_filename(filename) }
    end

end

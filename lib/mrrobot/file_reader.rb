require_relative 'reader_interface'

module Mrrobot
  class FileReader
    include ReaderInterface

    def self.each_line(file)
      return unless file
      File.open(file.to_s, 'r') do |f|
        f.each_line.lazy.each do |line|
          yield line
        end
      end
    end
  end
end

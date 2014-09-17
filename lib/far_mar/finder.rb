module FarMar
  class Finder

    # attr_accessor :file_name, :id
    #
    # def initialize
    #   @id = 0
    # end

    def self.set_path(file_name)
      @file_name = file_name
    end

    def self.all
      # return all instances of this class
      temp_array = []
      CSV.open(@file_name,'r').each do |line|
        temp_array << self.new(line) #this may not work
      end
      return temp_array
    end

    def self.find(id=0)
      #return a specific array (of the row).
      temp = self.all
      return temp.find{|item| item.id == id}
    end
  end
end

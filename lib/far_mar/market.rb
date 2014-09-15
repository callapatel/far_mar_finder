module FarMar
  class Market

    attr_accessor :id, :name

    def initialize(row)
      @id = row[0]
      @name = row[1]
      @address = row[2]
      @city = row[3]
      @county = row[4]
      @state = row[5]
      @zip = row[6]
    end


  def self.all
    #read the entire file, and object is created and pushed into an array.
    temp_array = []
    CSV.open("markets.csv",'r').each do |line|
      temp_array << Market.new(line) #this may not work
    end
    return temp_array
  end

  def self.find(id)
    #return a specific array (of the row).
  end

  def vendors
    #given the market_id we will return an array of vendors.
  end

  end
end

#FarMar::Market (How you will call this class)

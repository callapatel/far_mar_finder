module FarMar
  class Market

    attr_accessor :id, :name, :address, :city, :county, :state, :zip

    def initialize(row)
      @id = row[0].to_i
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
    CSV.open("support/markets.csv",'r').each do |line|
      temp_array << Market.new(line) #this may not work
    end
    return temp_array
  end

  def self.find(id)
    #return a specific array (of the row).
    temp = Market.all
    return temp.find{|market| market.id == id}
  end

  def vendors
    #given the market_id we will return an array of vendors.
    FarMar::Vendor.by_market(id)
  end

  end
end

#FarMar::Market (How you will call this class)

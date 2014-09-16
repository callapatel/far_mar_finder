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

    def products
      # returns a collection of product instances associated to this market use .unique
      vendors.collect{|vendor| vendor.products}.flatten.uniq
    end

    def self.search(string)
      # returns a collection of markets whose names include string or whose vendors contains string
      Market.all.find_all do |market|

        if market.name.downcase.include?(string)  ||
          market.vendors.collect{|vendor| vendor.name.downcase.include?(string)}.include?(true)
          market
        end
      end
    end

    def preferred_vendor
      #vendor with the highest revenue in this specific market
      vendors.max_by{|vendor| vendor.revenue }
    end

    def prefered_vendor(date)
      #returns revenue for the highest vendor in a given date
      vendors.max_by{|vendor| vendor.revenue(date) }
    end

    def worst_vendor
      #returns vendor with the lowest revenue
      vendors.min_by{|vendor| vendor.revenue }
    end

    def worst_vendor(date)
      vendors.min_by{|vendor| vendor.revenue(date) }
    end

  end
end
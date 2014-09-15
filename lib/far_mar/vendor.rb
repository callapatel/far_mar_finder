module FarMar
  class Vendor
    attr_accessor :id, :name

    def initialize(row)
      @id = row[0]
      @name = row[1]
      @employees = row[2]
      @market_id = row[3]
    end

    def self.all
      temp_array = []
      CSV.open("support/vendors.csv",'r').each do |line|
        temp_array << Vendor.new(line) #this may not work
      end
      return temp_array
    end

    def self.find(vendor_id)
      temp = Vendor.all
      return temp.find{|vendor| vendor.id == id}
    end

    def self.by_market(market_id)
      temp = Vendor.all
      return temp.find_all{|vendor| @market_id == market_id}
    end

    def market
      # take market_id for this vendor and return market instanceit
    end

    def sales
      # returns an array of sales instances with this vendor's id
    end

    def revenue
      # returns revenue in cents made from all sales by this vendor
    end

    def product
      # returns array of product instances for this vendor

    end

  end
end

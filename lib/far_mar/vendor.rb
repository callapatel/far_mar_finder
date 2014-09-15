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
      # read the entire file, and object is created and pushed into an array.
    end

    def self.find(vendor_id)
      # return a specific array (of the row).
    end

    def self.by_market(market_id)
      # return all vendor objects with this market id

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

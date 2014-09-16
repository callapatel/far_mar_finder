module FarMar
  class Sale
    attr_accessor :id, :name

    def initialize(row)
      @id = row[0].to_i
      @amount = row[1].to_i #in cents
      @purchase_time = row[2]
      @vendor_id = row[3].to_i
      @product_id = row[4].to_i
    end

    def self.all
      # read the entire file, and object is created and pushed into an array.
    end

    def self.find(id)
      # return a specific array (of the row).
    end

    def vendor
      #returns associated vendor
    end

    def product
      #returns product instance
    end

    def self.between(beginning_time, end_time)
      #returns array of sale instances
    end


  end
end

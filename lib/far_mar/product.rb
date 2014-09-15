module FarMar
  class Product
    attr_accessor :id, :name

    def initialize(row)
      @id = row[0]
      @name = row[1]
      @vendor_id = row[2]
    end

    def self.all
      # read the entire file, and object is created and pushed into an array.
    end

    def self.find(id)
      # return a specific array (of the row).
    end



  def vendor
    #using instance ID return vendor instance
  end

  def sales
    #array of sale instances
  end

  def number_of_sales
    #number of times product sold
  end

  def self.by_vendor(vendor_id)
    #given vendor id return all products within an array specific to that array
  end




  end
end

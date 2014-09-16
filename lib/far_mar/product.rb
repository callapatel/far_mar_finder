module FarMar
  class Product
    attr_accessor :id, :name, :vendor_id

    def initialize(row)
      @id = row[0].to_i
      @name = row[1]
      @vendor_id = row[2].to_i
    end

    def self.all
      # returns all product instances
      temp_array = []
      CSV.open("support/products.csv",'r').each do |line|
        temp_array << Product.new(line) #this may not work
      end
      return temp_array
    end

    def self.find(id)
      # returns specific product instance given an id number
      temp = Product.all
      return temp.find{|product| product.id == id}
    end

    def vendor
      #using instance ID return vendor instance
      return FarMar::Vendor.find(@vendor_id)
    end

    def sales
      #array of sale instances
      FarMar::Sale.all.find_all{ |sales| sales.product_id == id}

    end

    def number_of_sales
      #number of times product sold
      sales.count
    end

    def self.by_vendor(id)
      # returns all the products with this vendor id
      Product.all.find_all{|product| product.vendor_id == id}

    end

  end
end

module FarMar
  class Sale
    attr_accessor :id, :name, :amount, :purchase_time, :vendor_id, :product_id

    def initialize(row)
      @id = row[0].to_i
      @amount = row[1].to_i #in cents
      @purchase_time = Time.parse(row[2])
      @vendor_id = row[3].to_i
      @product_id = row[4].to_i
    end

    def self.all
      temp_array = []
      CSV.open("support/sales.csv",'r').each do |line|
        temp_array << Sale.new(line) #this may not work
      end
      return temp_array
    end

    def self.find(id)
      # return a specific array (of the row).
      temp = Sale.all
      return temp.find{|sale| sale.id == id}
    end

    def vendor
      #returns associated vendor
      return FarMar::Vendor.find(vendor_id)
    end

    def product
      #returns product instance
      return FarMar::Product.find(product_id)
    end

    def self.between(beginning_time, end_time)
      # returns all sale instances occurring between these times
      a = beginning_time#.to_i
      b = end_time#.to_i
      Sale.all.find_all {|sale| sale.purchase_time <b && sale.purchase_time >=a}
    end


  end
end

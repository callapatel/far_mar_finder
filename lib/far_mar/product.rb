module FarMar
  class Product < Finder
    attr_accessor :id, :name, :vendor_id

    set_path("support/products.csv")

    def initialize(row)
      @id = row[0].to_i
      @name = row[1]
      @vendor_id = row[2].to_i
    end

    # def self.all
    #   # returns all product instances
    #   temp_array = []
    #   CSV.open("support/products.csv",'r').each do |line|
    #     temp_array << Product.new(line) #this may not work
    #   end
    #   return temp_array
    # end

    # def self.find(id)
    #   # returns specific product instance given an id number
    #   temp = Product.all
    #   return temp.find{|product| product.id == id}
    # end

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

    def revenue
      sales.inject(0){|sum,sale| sum += sale.amount}
    end

    def self.most_revenue(n)
      #returns the top n products instance ranked by total revenue
      temp = Product.all
      temp.sort_by{|product| product.sales.inject(0){|sum,sale| sum += sale.amount}}.reverse.first(n)
      #a.each {|product| puts product.name, product.revenue}
    end


    def self.find_by_name(match)
      #want to find market by name
      temp = Product.all
      return temp.find{|product| product.name.downcase.include? match.downcase}
    end

    def self.find_all_by_name(match)
      temp = Product.all
      return temp.find_all{|product| product.name.downcase.include? match.downcase }
    end

  end
end

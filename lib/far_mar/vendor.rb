module FarMar
  class Vendor
    attr_accessor :id, :name, :no_of_employees, :market_id

    def initialize(row)
      @id = row[0].to_i
      @name = row[1]
      @no_of_employees = row[2].to_i
      @market_id = row[3].to_i
    end

    def self.all
      temp_array = []
      CSV.open("support/vendors.csv",'r').each do |line|
        temp_array << Vendor.new(line) #this may not work
      end
      return temp_array
    end

    def self.find(id)
      temp = Vendor.all
      return temp.find{|vendor| vendor.id == id}
    end

    def self.by_market(market_id)
      #returns all of the vendors with the given market ID
      temp = Vendor.all
      return temp.find_all{|vendor| vendor.market_id == market_id}
    end

    def market
      # take market_id for this vendor and return market instance
      FarMar::Market.find(@market_id)

    end

    def sales
      # returns an array of sales instances with this vendor's id
      FarMar::Sale.all.find_all{|sales| sales.vendor_id == id}
    end

    def revenue
      # returns revenue in cents made from all sales by this vendor
      sales.inject(0){|sum, sale| sum+= sale.amount}
    end

    def products
      # returns array of product instances for this vendor
      FarMar::Product.all.find_all{|product| product.vendor_id == id}

    end

    def self.most_revenue(n)
      #returns top n vendor instances ranked by total rev
      temp = Vendor.all
      temp.sort_by{|vendor| vendor.revenue }.reverse.first(n)
      #new_array = temp.sort_by{|vendor| vendor.revenue }.reverse.first(n)
      #new_array.each {|vendor| puts vendor.revenue}
    end

    def self.most_items(n)
      #returns top n vendor instances ranked by most items sold
      temp = Vendor.all
      temp.sort_by{|vendor| vendor.sales.count }.reverse.first(n)
      # new_array = temp.sort_by{|vendor| vendor.sales.count }.reverse.first(n)
      # new_array.each {|vendor| puts vendor.sales.count}
    end

    def self.revenue(date)
      #add all revenues for a specific date
      day = Time.parse(date)
      # puts day.inspect
      next_day = day + 86400
      temp = FarMar::Sale.between(day,next_day)
      temp.inject(0){|sum, sale| sum+=sale.amount}
    end

    def revenue_by_date(date)
      # revenue for a specific date for this vendor
      day = Time.parse(date)
      temp = sales.find_all{|sale| puts sale.purchase_time.inspect;sale.purchase_time >= day && sale.purchase_time < (day + 86400)}
      temp.inject(0){|sum,sale| sum += sale.amount}
    end

  def self.find_by_name(match)
    #want to find market by name
    temp = Vendor.all
    return temp.find{|vendor| vendor.name.downcase.include? match.downcase}
  end

  def self.find_all_by_name(match)
    temp = Vendor.all
    return temp.find_all{|vendor| vendor.name.downcase.include? match.downcase }
  end

  end
end

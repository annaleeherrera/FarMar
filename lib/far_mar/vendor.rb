require 'csv'
module FarMar
  class Vendor
    attr_reader :id, :name, :num_employees, :market_id , :vendor_csv
    def initialize(vendor_hash)
      @id = vendor_hash[:id].to_i
      @name = vendor_hash[:name]
      @num_employees= vendor_hash[:num_employees].to_i
      @market_id = vendor_hash[:market_id].to_i
      @vendor_csv = ("./support/vendors.csv")
    end

    def self.all
      @@vendors_all ||=

        CSV.read("support/vendors.csv").map do |row|
          #binding.pry
          FarMar::Vendor.new({
          id: row[0].to_i,
          name: row[1],
          num_employees: row[2].to_i,
          market_id: row[3].to_i
        })
      end
    end

    def self.find(id)
      # all_markets = FarMar::Market.all
      all.find(id) do |vendors|
        vendors.id == id
      end
    end
  end
end


# vendor_hash=
#{ id: 1500,
#name: "Remlinger Farms",
#num_employees: 8
#market_id =
# }

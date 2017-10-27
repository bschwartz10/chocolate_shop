class OrdersWriter
  def self.export(orders)
    CSV.open('output/redemptions.csv', 'wb') do |csv|
      orders.each do |order|
        csv << order.redemptions.map {|flavor, val| "#{flavor.to_s.gsub("_", " ")} #{val}"}
      end
    end
  end
end

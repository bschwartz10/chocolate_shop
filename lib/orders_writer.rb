class OrdersWriter
  def self.export(orders)
    CSV.open('output/redemptions.csv', 'wb') do |csv|
      orders.each do |order|
        csv << order.redemptions.map {|flavor, quantity| "#{flavor.to_s.gsub("_", " ")} #{quantity}"}
      end
    end
  end
end

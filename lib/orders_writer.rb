class OrdersWriter
  def self.write_order(orders)
    CSV.open('output/redemptions.csv', 'wb') do |csv|
      orders.each do |order|
        csv << ["milk #{order[:milk]}", "dark #{order[:dark]}", "white #{order[:white]}", "sugar free #{order[:sugar_free]}"]
      end
    end
  end
end

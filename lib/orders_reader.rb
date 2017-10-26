class OrdersReader
  def self.read_orders(orders_csv)
    orders = []
    CSV.foreach(orders_csv, headers: true, header_converters: :symbol) do |row|
      orders << Order.new(row)
    end
    orders
  end
end

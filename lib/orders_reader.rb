class OrdersReader
  def self.read_orders(orders_csv)
    Orders.new(CSV.open orders_csv, headers: true, header_converters: :symbol)
  end
end

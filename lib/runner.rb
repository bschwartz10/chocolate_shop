require 'csv'
require './lib/orders_reader'
require './lib/order'
require './lib/orders_writer'
require './lib/promotion'

orders_csv = './input/orders.csv'
orders = OrdersReader.read_orders(orders_csv)
redemptions = orders.map do |order|
  bought_chocolates = order.initial_chocolates_bought(order.type)
  order.initial_wrappers_obtained(order.type, bought_chocolates)
  order.chocolate_promotion(order.wrappers_needed)
end
OrdersWriter.write_order(redemptions)

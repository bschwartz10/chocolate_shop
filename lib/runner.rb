require 'csv'
require './lib/orders_reader'
require './lib/incoming_orders'
require './lib/incoming_order'
require './lib/outgoing_order'
require './lib/orders_writer'
require './lib/outgoing_orders'

orders_csv = './input/orders.csv'
orders = OrdersReader.read_orders(orders_csv)
outputs = orders.all.map do |order|
  order.initial_chocolates_bought(order.type)
  order.chocolate_promotion(order.wrappers_needed)
end
OrdersWriter.write_order(outputs)

require 'csv'
require './lib/orders_reader'
require './lib/orders'
require './lib/incoming_order'
require './lib/outgoing_order'
require './lib/orders_writer'

orders_csv = './input/orders.csv'
orders = OrdersReader.read_orders(orders_csv)
outputs = orders.all.map do |order|
  order.chocolate_promotion(order.wrappers_needed, order.initial_chocolates_bought(order.type), order.type)
end
OrdersWriter.new(outputs).write_order

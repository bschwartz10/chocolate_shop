require 'csv'
require './lib/orders_reader'
require './lib/order'
require './lib/orders_writer'
require './lib/promotion'

orders_csv = './input/orders.csv'
orders = OrdersReader.read_orders(orders_csv)
orders.each(&:process!)
OrdersWriter.export(orders)

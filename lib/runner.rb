require 'csv'
require './lib/orders_reader'
require './lib/order'
require './lib/orders_writer'
require './lib/promotion'

orders_csv = './input/orders.csv'
raw_orders = OrdersReader.read_orders(orders_csv)
orders = raw_orders.map(&:process!)
OrdersWriter.export(orders)

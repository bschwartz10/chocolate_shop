require 'csv'
require './lib/order'

class OrdersWriter
  attr_reader :milk, :dark, :white, :sugar_free

  def initialize(order)
    @milk = order['milk']
    @dark = order['dark']
    @white = order['white']
    @sugar_free = order['sugar_free']
  end

  def write_order
    CSV.open('output/redemptions.csv', 'wb') do |csv|
      csv << ["milk #{milk}", "dark #{dark}", "white #{white}", "sugar free #{sugar_free}"]
    end
  end
end

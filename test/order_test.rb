require './lib/orders_reader'
require './lib/orders'
require './lib/orders'
require 'minitest/autorun'
require 'minitest/pride'

class OrderTest < Minitest::Test
  attr_reader :order

  def setup
    @order = Order.new({
      cash: 12,
      price: 2,
      wrappers_needed: 5,
      type: 'milk'
    })
  end

  def test_an_order_can_be_created_through_reading_csv_file
    orders_csv = './input/orders.csv'
    orders = OrdersReader.read_orders(orders_csv)

    assert_instance_of Order, orders.all.first
  end

  def test_order_has_cash
    assert_equal 12, order.cash
  end

  def test_order_has_price
    assert_equal 2, order.price
  end

  def test_order_has_wrappers_needed
    assert_equal 5, order.wrappers_needed
  end

  def test_order_has_type
    assert_equal 'milk', order.type
  end

end

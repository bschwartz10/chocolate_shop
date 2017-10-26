require './test/test_helper'

class IncomingOrdersTest < Minitest::Test
  def test_all_method_returns_an_array_of_four_order_objects
    orders_csv = './input/orders.csv'
    orders = OrdersReader.read_orders(orders_csv)

    assert_instance_of Array, orders.all
    assert_instance_of IncomingOrder, orders.all.first
    assert_equal 4, orders.all.count
  end
end

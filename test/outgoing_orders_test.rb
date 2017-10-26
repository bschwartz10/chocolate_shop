require './test/test_helper'

class OutgoingOrdersTest < Minitest::Test
  attr_reader :outgoing_orders

  def setup
    orders = [{milk: 7, dark: 0, white: 0, sugar_free: 1},
              {milk: 0, dark: 3, white: 0, sugar_free: 0},
              {milk: 0, dark: 3, white: 0, sugar_free: 5},
              {milk: 0, dark: 1, white: 5, sugar_free: 3}]
    @outgoing_orders = OutgoingOrders.new(orders)
  end

  def test_outgoing_orders_can_be_created_from_incoming_order_promotion_output
    assert_instance_of OutgoingOrders, outgoing_orders
  end

  def test_outgoing_orders_is_a_collection_of_outgoing_order_objects
    assert_instance_of Array, outgoing_orders.all
    assert_instance_of OutgoingOrder, outgoing_orders.all.first
    assert_equal 4, outgoing_orders.all.count
  end
end

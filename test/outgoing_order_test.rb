require './test/test_helper'

class OutgoingOrderTest < Minitest::Test
  attr_reader :outgoing_order

  def setup
    @outgoing_order = OutgoingOrder.new({milk: 7, dark: 0, white: 0, sugar_free: 1})
  end

  def test_outgoing_order_writer_exists
    assert_kind_of Class, OutgoingOrder
  end

  def test_outgoing_order_has_milk_quantity
    assert_equal 7, outgoing_order.milk
  end

  def test_outgoing_order_has_dark_quantity
    assert_equal 0, outgoing_order.dark
  end

  def test_outgoing_order_has_white_quantity
    assert_equal 0, outgoing_order.white
  end

  def test_outgoing_order_has_sugar_free_quantity
    assert_equal 1, outgoing_order.sugar_free
  end

end

require './lib/orders_reader'
require './lib/orders'
require './lib/orders'
require 'minitest/autorun'
require 'minitest/pride'

class OrderTest < Minitest::Test
  attr_reader :order

  def setup
    @order = Order.new({
      cash: 14,
      price: 2,
      wrappers_needed: 6,
      type: 'milk'
    })
  end

  def test_an_order_can_be_created_through_reading_csv_file
    orders_csv = './input/orders.csv'
    orders = OrdersReader.read_orders(orders_csv)

    assert_instance_of Order, orders.all.first
  end

  def test_order_has_cash
    assert_equal 14, order.cash
  end

  def test_order_has_price
    assert_equal 2, order.price
  end

  def test_order_has_wrappers_needed
    assert_equal 6, order.wrappers_needed
  end

  def test_order_has_type
    assert_equal 'milk', order.type
  end

  def order_has_output
    output = {"milk"=>0, "dark"=>0, "white"=>0, "sugar_free"=>0}
    assert_equal output, order.output
  end

  def test_initial_chocolates_bought
    assert_equal 7, order.initial_chocolates_bought(order.type)
  end

  def test_milk_chocolate_promotion
    output_after_promotion = {"milk"=>8, "dark"=>0, "white"=>0, "sugar_free"=>1}
    assert_equal output_after_promotion, order.chocolate_promotion(order.wrappers_needed, order.initial_chocolates_bought(order.type), order.type)
  end

  def test_different_milk_chocolate_promotion
    mc_two_order = Order.new({
      cash: 12,
      price: 2,
      wrappers_needed: 5,
      type: 'milk'
    })

    output_after_promotion = {"milk"=>7, "dark"=>0, "white"=>0, "sugar_free"=>1}
    assert_equal output_after_promotion, mc_two_order.chocolate_promotion(mc_two_order.wrappers_needed, mc_two_order.initial_chocolates_bought(mc_two_order.type), mc_two_order.type)
  end

  def test_white_chocolate_promotion
    wc_order = Order.new({
      cash: 6,
      price: 2,
      wrappers_needed: 2,
      type: 'white'
    })
    output_after_promotion = {"milk"=>0, "dark"=>1, "white"=>5, "sugar_free"=>3}
    assert_equal output_after_promotion, wc_order.chocolate_promotion(wc_order.wrappers_needed, wc_order.initial_chocolates_bought(wc_order.type), wc_order.type)
  end

  def test_dark_chocolate_promotion
    dc_order = Order.new({
      cash: 12,
      price: 4,
      wrappers_needed: 4,
      type: 'dark'
    })
    output_after_promotion = {"milk"=>0, "dark"=>3, "white"=>0, "sugar_free"=>0}
    assert_equal output_after_promotion, dc_order.chocolate_promotion(dc_order.wrappers_needed, dc_order.initial_chocolates_bought(dc_order.type), dc_order.type)
  end

  def test_sugar_free_chocolate_promotion
    sf_order = Order.new({
      cash: 6,
      price: 2,
      wrappers_needed: 2,
      type: 'sugar_free'
    })
    output_after_promotion = {"milk"=>0, "dark"=>3, "white"=>0, "sugar_free"=>5}
    assert_equal output_after_promotion, sf_order.chocolate_promotion(sf_order.wrappers_needed, sf_order.initial_chocolates_bought(sf_order.type), sf_order.type)
  end

end

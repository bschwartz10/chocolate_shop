require './test/test_helper'

class OrderTest < Minitest::Test
  attr_reader :mc_order, :mc_two_order, :wc_order, :dc_order, :sf_order

  def setup
    @mc_order = Order.new({
      cash: '14',
      price: '2',
      wrappers_needed: '6',
      type: 'milk'
    })

    @mc_two_order = Order.new({
      cash: '12',
      price: '2',
      wrappers_needed: '5',
      type: 'milk'
    })

    @wc_order = Order.new({
      cash: '6',
      price: '2',
      wrappers_needed: '2',
      type: 'white'
    })

    @sf_order = Order.new({
      cash: '6',
      price: '2',
      wrappers_needed: '2',
      type: 'sugar free'
    })

    @dc_order = Order.new({
      cash: '12',
      price: '4',
      wrappers_needed: '4',
      type: 'dark'
    })
  end

  def test_an_order_can_be_created_through_reading_csv_file
    orders_csv = './input/orders.csv'
    orders = OrdersReader.read_orders(orders_csv)

    assert_instance_of Order, orders.first
  end

  def test_order_has_cash
    assert_equal 14, mc_order.cash
  end

  def test_order_has_price
    assert_equal 2, mc_order.price
  end

  def test_order_has_wrappers_needed
    assert_equal 6, mc_order.wrappers_needed
  end

  def test_order_has_type
    assert_equal :milk, mc_order.type
  end

  def test_order_has_redemptions
    assert_equal({milk: 0, dark: 0, white: 0, sugar_free: 0}, mc_order.redemptions)
  end

  def test_order_has_available_wrappers
    assert_equal({milk: 0, dark: 0, white: 0, sugar_free: 0}, mc_order.available_wrappers)
  end

  def test_initial_chocolates_bought
    assert_equal 7, mc_order.send(:initial_chocolates_bought)
  end

  def test_initial_wrappers_obtained
    bought_chocolates = mc_order.send(:initial_chocolates_bought)

    assert_equal 7, mc_order.send(:initial_wrappers_obtained, bought_chocolates)
  end

  def test_milk_chocolate_promotion
    output_after_promotion = {milk: 8, dark: 0, white: 0, sugar_free: 1}
    mc_order.process!

    assert_equal output_after_promotion, mc_order.redemptions
  end

  def test_different_milk_chocolate_promotion
    output_after_promotion = {milk: 7, dark: 0, white: 0, sugar_free: 1}
    mc_two_order.process!

    assert_equal output_after_promotion, mc_two_order.redemptions
  end

  def test_white_chocolate_promotion
    output_after_promotion = {milk: 0, dark: 1, white: 5, sugar_free: 3}
    wc_order.process!

    assert_equal output_after_promotion, wc_order.redemptions
  end

  def test_dark_chocolate_promotion
    output_after_promotion = {milk: 0, dark: 3, white: 0, sugar_free: 0}
    dc_order.process!

    assert_equal output_after_promotion, dc_order.redemptions
  end

  def test_sugar_free_chocolate_promotion
    output_after_promotion = {milk: 0, dark: 3, white: 0, sugar_free: 5}
    sf_order.process!

    assert_equal output_after_promotion, sf_order.redemptions
  end

  def test_add_chocolates_increases_appropriate_output_for_milk_chocolate
    output_after_adding_chocolates = {milk: 1, dark: 0, white: 0, sugar_free: 1}
    mc_order.send(:add_chocolates, :milk)

    assert_equal output_after_adding_chocolates, mc_order.redemptions
  end

  def test_add_chocolates_increases_available_wrappers_for_milk_chocolate
    available_wrappers_after_adding_chocolates = {milk: 1, dark: 0, white: 0, sugar_free: 1}
    mc_order.send(:add_chocolates, :milk)

    assert_equal available_wrappers_after_adding_chocolates, mc_order.available_wrappers
  end

  def test_add_chocolates_increases_appropriate_output_for_white_chocolate
    output_after_adding_chocolates = {milk: 0, dark: 0, white: 1, sugar_free: 1}
    wc_order.send(:add_chocolates, :white)

    assert_equal output_after_adding_chocolates, wc_order.redemptions
  end

  def test_add_chocolates_increases_available_wrappers_for_white_chocolate
    available_wrappers_after_adding_chocolates = {milk: 0, dark: 0, white: 1, sugar_free: 1}
    wc_order.send(:add_chocolates, :white)

    assert_equal available_wrappers_after_adding_chocolates, wc_order.available_wrappers
  end

  def test_add_chocolates_increases_appropriate_output_for_sugar_free_chocolate
    output_after_adding_chocolates = {milk: 0, dark: 1, white: 0, sugar_free: 1}
    sf_order.send(:add_chocolates, :sugar_free)

    assert_equal output_after_adding_chocolates, sf_order.redemptions
  end

  def test_add_chocolates_increases_available_wrappers_for_sugar_free_chocolate
    available_wrappers_after_adding_chocolates = {milk: 0, dark: 1, white: 0, sugar_free: 1}
    sf_order.send(:add_chocolates, :sugar_free)

    assert_equal available_wrappers_after_adding_chocolates, sf_order.available_wrappers
  end

  def test_add_chocolates_increases_appropriate_output_for_dark_chocolate
    output_after_adding_chocolates = {milk: 0, dark: 1, white: 0, sugar_free: 0}
    dc_order.send(:add_chocolates, :dark)

    assert_equal output_after_adding_chocolates, dc_order.redemptions
  end

  def test_add_chocolates_increases_available_wrappers_for_dark_chocolate
    available_wrappers_after_adding_chocolates = {milk: 0, dark: 1, white: 0, sugar_free: 0}
    dc_order.send(:add_chocolates, :dark)

    assert_equal available_wrappers_after_adding_chocolates, dc_order.available_wrappers
  end
end

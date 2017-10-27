require './test/test_helper'

class OrdersReaderTest < Minitest::Test
  def test_orders_reader_exists
    assert_kind_of Class, OrdersReader
  end

  def test_read_orders_method_reads_orders_csv_file_and_returns_array
    orders_csv = './input/orders.csv'

    assert_instance_of Array, OrdersReader.read_orders(orders_csv)
  end

  def test_read_orders_method_returns_an_array_of_orders
    orders_csv = './input/orders.csv'

    assert_instance_of Order, OrdersReader.read_orders(orders_csv).first
  end
end

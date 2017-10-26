require './test/test_helper'

class OrdersReaderTest < Minitest::Test
  def test_orders_reader_exists
    assert_kind_of Class, OrdersReader
  end

  def test_read_orders_method_reads_orders_csv_file_and_creates_incoming_orders
    orders_csv = './input/orders.csv'

    assert_instance_of IncomingOrders, OrdersReader.read_orders(orders_csv)
  end
end

require './lib/orders_writer'
require 'minitest/autorun'
require 'minitest/pride'

class OrdersWriterTest < Minitest::Test
  def test_orders_writer_exists
    assert_kind_of Class, OrdersWriter
  end

  def test_write_orders_method_writes_a_new_csv_file_with_correct_output
    order = {"milk"=>7, "dark"=>0, "white"=>0, "sugar_free"=>1}
    OrdersWriter.new(order).write_orders
    actual_csv = IO.readlines('./output/redemptions.csv')
    first_line = actual_csv[0].strip
    
    assert_equal 'milk 7,dark 0,white 0,sugar free 1', first_line
  end

end

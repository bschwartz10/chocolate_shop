require './test/test_helper'

class OrdersWriterTest < Minitest::Test
  def test_orders_writer_exists
    assert_kind_of Class, OrdersWriter
  end

  def test_write_orders_method_writes_a_new_csv_file_with_correct_output
    orders = [{'milk'=>7, 'dark'=>0, 'white'=>0, 'sugar free'=>1},
              {'milk'=>0, 'dark'=>3, 'white'=>0, 'sugar free'=>0},
              {'milk'=>0, 'dark'=>3, 'white'=>0, 'sugar free'=>5},
              {'milk'=>0, 'dark'=>1, 'white'=>5, 'sugar free'=>3}]
    OrdersWriter.new(orders).write_order
    actual_csv = IO.readlines('./output/redemptions.csv')
    first_line = actual_csv[0].strip
    second_line = actual_csv[1].strip
    third_line = actual_csv[2].strip
    fourth_line = actual_csv[3].strip

    assert_equal 'milk 7,dark 0,white 0,sugar free 1', first_line
    assert_equal 'milk 0,dark 3,white 0,sugar free 0', second_line
    assert_equal 'milk 0,dark 3,white 0,sugar free 5', third_line
    assert_equal 'milk 0,dark 1,white 5,sugar free 3', fourth_line
  end

end

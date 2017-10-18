class OrdersWriter
  attr_reader :all

  def initialize(orders)
    @all = orders.map {|order| OutgoingOrder.new(order)}
  end

  def write_order
    CSV.open('output/redemptions.csv', 'wb') do |csv|
      all.each do |order|
        csv << ["milk #{order.milk}", "dark #{order.dark}", "white #{order.white}", "sugar free #{order.sugar_free}"]
      end
    end
  end
end

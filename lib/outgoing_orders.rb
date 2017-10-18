class OutgoingOrders
  attr_reader :all

  def initialize(orders)
    @all = orders.map {|order| OutgoingOrder.new(order)}
  end

end

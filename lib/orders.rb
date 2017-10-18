class Orders
  attr_reader :all

  def initialize(orders)
    @all = orders.map {|row| IncomingOrder.new(row)}
  end
end

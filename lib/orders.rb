require'./lib/order'

class Orders
  attr_reader :all

  def initialize(orders)
    @all = orders.map {|row| Order.new(row)}
  end
end

class OutgoingOrder
  attr_reader :milk, :dark, :white, :sugar_free

  def initialize(order)
    @milk = order['milk']
    @dark = order['dark']
    @white = order['white']
    @sugar_free = order['sugar free']
  end
  
end

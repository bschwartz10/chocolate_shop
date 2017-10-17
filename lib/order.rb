class Order
  attr_reader :cash, :price, :wrappers_needed, :type

  def initialize(order)
    @cash = order[:cash]
    @price = order[:price]
    @wrappers_needed = order[:wrappers_needed]
    @type = order[:type]
  end
  
end

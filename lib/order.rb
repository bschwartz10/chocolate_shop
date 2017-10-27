class Order
  attr_reader :cash, :price, :wrappers_needed, :type, :redemptions, :available_wrappers

  def initialize(order)
    @cash = order[:cash].to_i
    @price = order[:price].to_i
    @wrappers_needed = order[:wrappers_needed].to_i
    @type = order[:type].tr(' ', '_').to_sym
    @redemptions = {
      milk: 0,
      dark: 0,
      white: 0,
      sugar_free: 0
    }
    @available_wrappers = {
      milk: 0,
      dark: 0,
      white: 0,
      sugar_free: 0
    }
  end

  def initial_chocolates_bought(type)
    redemptions[type] += cash / price
  end

  def initial_wrappers_obtained(type, initial_wrappers)
    available_wrappers[type] += initial_wrappers
  end

  def chocolate_promotion(wrappers_needed)
    loop do
      free_chocolates = available_wrappers.select do |flavor, wrappers|
        wrappers >= wrappers_needed
      end
      free_chocolates.empty? ? break : run_promotion(free_chocolates)
    end
    redemptions
  end

  def run_promotion(free_chocolates)
    free_chocolates.each do |flavor, wrappers|
      available_wrappers[flavor] -= wrappers_needed
      add_chocolates(flavor)
    end
  end

  def add_chocolates(flavor)
    Promotion.new.promotions[flavor].each do |type, amount|
      redemptions[type] += amount
      available_wrappers[type] += amount
    end
  end

end

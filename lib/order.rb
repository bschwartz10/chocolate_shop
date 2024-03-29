class Order
  attr_reader :cash, :price, :wrappers_needed, :type, :redemptions, :available_wrappers

  def initialize(raw_order)
    @cash               = raw_order[:cash].to_i
    @price              = raw_order[:price].to_i
    @wrappers_needed    = raw_order[:wrappers_needed].to_i
    @type               = raw_order[:type].tr(' ', '_').to_sym
    @redemptions        = Hash[Promotion.rules.keys.map {|f| [f, 0]}]
    @available_wrappers = Hash[Promotion.rules.keys.map {|f| [f, 0]}]
  end

  def process!
    # execute promotion
    bought_chocolates = initial_chocolates_bought
    initial_wrappers_obtained(bought_chocolates)
    chocolate_promotion
  end

private

  def initial_chocolates_bought
    redemptions[type] += cash / price
  end

  def initial_wrappers_obtained(initial_wrappers)
    available_wrappers[type] += initial_wrappers
  end

  def chocolate_promotion
    # execute run_promotion until all eligible wrappers are traded in
    loop do
      free_chocolates = available_wrappers.select do |flavor, wrappers|
        wrappers >= wrappers_needed
      end
      free_chocolates.empty? ? break : run_promotion(free_chocolates)
    end
  end

  def run_promotion(free_chocolates)
    # trade in eligible wrappers and redeem free chocolates
    free_chocolates.each do |flavor, wrappers|
      available_wrappers[flavor] -= wrappers_needed
      add_chocolates(flavor)
    end
  end

  def add_chocolates(flavor)
    # retrieve correct chocolate redemptions and increase corresponding wrappers
    Promotion.rules[flavor].each do |type, amount|
      redemptions[type] += amount
      available_wrappers[type] += amount
    end
  end
end

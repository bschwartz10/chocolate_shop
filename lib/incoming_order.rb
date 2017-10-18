class IncomingOrder
  attr_reader :cash, :price, :wrappers_needed, :type, :output, :available_wrappers

  def initialize(order)
    @cash = order[:cash].to_i
    @price = order[:price].to_i
    @wrappers_needed = order[:wrappers_needed].to_i
    @type = order[:type]
    @output = {
      'milk' => 0,
      'dark' => 0,
      'white' => 0,
      'sugar free' => 0
    }
    @available_wrappers = {
      'milk' => 0,
      'dark' => 0,
      'white' => 0,
      'sugar free' => 0
    }
  end

  def initial_chocolates_bought(type)
    output[type] += cash / price
  end

  def chocolate_promotion(wrappers_needed, initial_chocolates_bought, type)
    available_wrappers[type] += initial_chocolates_bought
    remaining_wrappers = true

    until remaining_wrappers == false
      remaining_wrappers = false
      available_wrappers.each do |flavor, wrappers|
        if wrappers >= wrappers_needed
          available_wrappers[flavor] -= wrappers_needed
          add_chocolates(flavor)
          remaining_wrappers = true
        end
      end
    end
    output
  end

  def add_chocolates(flavor)
    if flavor == 'white'
      output['white'] += 1
      output['sugar free'] += 1
      available_wrappers['white'] += 1
      available_wrappers['sugar free'] += 1
    elsif flavor == 'sugar free'
      output['sugar free'] += 1
      output['dark'] += 1
      available_wrappers['sugar free'] += 1
      available_wrappers['dark'] += 1
    elsif flavor == 'milk'
      output['milk'] += 1
      output['sugar free'] += 1
      available_wrappers['milk'] += 1
      available_wrappers['sugar free'] += 1
    elsif flavor == 'dark'
      output['dark'] += 1
      available_wrappers['dark'] += 1
    end
  end

end

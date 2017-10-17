class Order
  attr_reader :cash, :price, :wrappers_needed, :type, :output, :available_wrappers

  def initialize(order)
    @cash = order[:cash]
    @price = order[:price]
    @wrappers_needed = order[:wrappers_needed]
    @type = order[:type]
    @output = {
      'milk' => 0,
      'dark' => 0,
      'white' => 0,
      'sugar_free' => 0
    }
    @available_wrappers = {
      'milk' => 0,
      'dark' => 0,
      'white' => 0,
      'sugar_free' => 0
    }
  end

  def initial_chocolates_bought(type)
    output[type] += cash / price
  end

  # def choose_promotion(type)
  #   complimentary_chocolate_promotions[type]
  # end
  #
  # def complimentary_chocolate_promotions
  #   {
  #     'milk' => milk_chocolate_promotion(wrappers_needed, initial_chocolates_bought),
  #     'white' => white_chocolate_promotion(wrappers_needed, initial_chocolates_bought)
  #   }
  # end

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
      output['sugar_free'] += 1
      available_wrappers['white'] += 1
      available_wrappers['sugar_free'] += 1
    elsif flavor == 'sugar_free'
      output['sugar_free'] += 1
      output['dark'] += 1
      available_wrappers['sugar_free'] += 1
      available_wrappers['dark'] += 1
    end
  end
  
  # def white_chocolate_promotion(wrappers_needed, available_wrappers)
  #   require "pry"; binding.pry
  #   until available_wrappers < wrappers_needed
  #     output['white'] += 1
  #     output['sugar_free'] += 1
  #     available_wrappers -= wrappers_needed
  #   end
  #   output
  # end

end

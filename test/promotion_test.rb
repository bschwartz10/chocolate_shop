require './test/test_helper'

class PromotionTest < Minitest::Test
  def test_promotion_class_exists
    assert_kind_of Class, Promotion
  end

  def test_schedule_method_is_a_hash
    assert_instance_of Hash, Promotion.rules
  end

  def test_has_keys_of_milk_dark_sugar_free_and_white
    keys = [:milk, :dark, :white, :sugar_free]

    assert_equal Promotion.rules.keys, keys
  end

  def test_flavors_have_values_that_are_hashes
    assert_instance_of Hash, Promotion.rules[:milk]
  end

  def test_milk_has_promotion_for_milk_and_sugar_free
    milk_promotion = {milk: 1, sugar_free: 1}

    assert_equal Promotion.rules[:milk], milk_promotion
  end

  def test_dark_has_promotion_for_dark
    dark_promotion = {dark: 1}

    assert_equal Promotion.rules[:dark], dark_promotion
  end

  def test_white_has_promotion_for_white_and_sugar_free
    white_promotion = {white: 1, sugar_free: 1}

    assert_equal Promotion.rules[:white], white_promotion
  end

  def test_sugar_free_has_promotion_for_sugar_free_and_dark
    sugar_free_promotion = {sugar_free: 1, dark: 1}

    assert_equal Promotion.rules[:sugar_free], sugar_free_promotion
  end
end

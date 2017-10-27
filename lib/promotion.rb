class Promotion
  def self.schedule
    {
      milk: {
        milk: 1,
        sugar_free: 1,
      },
      dark: {
        dark: 1
      },
      white: {
        white: 1,
        sugar_free: 1,
      },
      sugar_free: {
        sugar_free: 1,
        dark: 1,
      },
    }
  end

end

class Plant < ApplicationRecord
  scope :living, -> { where(alive: true) }
  scope :deceased, -> { where.not(alive: true) }

  validates :food_status, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 10,
    message: "Food must be between 0 and 10"
  }
  validates :mood_status, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 10,
    message: "Mood must be between 0 and 10"
  }
  validates :water_status, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 10,
    message: "Water must be between 0 and 10"
  }
  validates :sunlight_status, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 10,
    message: "Sunlight must be between 0 and 10"
  }
  validates :health_status, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 10,
    message: "Health must be between 0 and 10"
  }
  validates :disposition, inclusion: {
    in: %w(easygoing neutral irritable),
    message: "Disposition can only be easygoing, neutral, or irritable"
  }

  def time_alive
    created_time = created_at.to_date
    (in_game_time - created_time).to_i
  end

  def self.affirmations
    {
      1 => "Hooray! You made it through one day. Good job!",
      5 => "Wow, a whole week (kinda)! You're clearly amazing at plant management",
      10 => "Ten days??? You've gotta be kiddin me! You are a unique talent and you should be proud.",
      30 => "A MONTH?!?!?! I am at a loss for words (except these words)",
      50 => "50 days of plant!!!!!!!! WOWWWWWWWWW"
    }
  end
end

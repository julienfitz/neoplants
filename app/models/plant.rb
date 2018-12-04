class Plant < ApplicationRecord
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
end

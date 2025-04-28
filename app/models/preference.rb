class Preference < ApplicationRecord
  belongs_to :profile

  enum work_type: { full_time: 0, contract: 1 }
  enum working_hours: {
    one_day_per_week: 0,
    two_days_per_week: 1,
    three_days_per_week: 2,
    four_days_per_week: 3,
    five_days_per_week: 4
  }
end

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

  scope :by_min_salary, lambda { |min_salary|
    where('min_salary >= ?', min_salary) if min_salary.present?
  }

  scope :by_max_salary, lambda { |max_salary|
    where('max_salary <= ?', max_salary) if max_salary.present?
  }

  scope :by_work_type, lambda { |work_type|
    where(work_type: work_type) if work_type.present?
  }

  scope :by_working_hours, lambda { |working_hours|
    where(working_hours: working_hours) if working_hours.present?
  }

  scope :by_tech_stack, lambda { |tech_stack|
    where('tech_stack ILIKE ?', "%#{tech_stack}%") if tech_stack.present?
  }
end

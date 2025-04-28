class ProfilePreferenceSearch
  include ActiveModel::Model

  attr_accessor :status, :full_name, :email, :min_salary, :max_salary, :work_type, :working_hours, :tech_stack

  # validates :status, :work_type, :working_hours, presence: true

  def search
    profiles = Profile.includes(:preference)

    profiles = profiles.by_status(status)
    profiles = profiles.by_full_name(full_name)
    profiles = profiles.by_email(email)
    profiles = profiles.by_min_salary(min_salary)
    profiles = profiles.by_max_salary(max_salary)
    profiles = profiles.by_work_type(work_type)
    profiles = profiles.by_working_hours(working_hours)
    profiles.by_tech_stack(tech_stack)
  end
end

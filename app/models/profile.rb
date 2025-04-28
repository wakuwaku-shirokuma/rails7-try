class Profile < ApplicationRecord
  belongs_to :office
  has_many :selections
  has_one :preference, dependent: :destroy

  scope :by_status, lambda { |status|
    where(status: status) if status.present?
  }

  scope :by_full_name, lambda { |full_name|
    where('full_name ILIKE ?', "%#{full_name}%") if full_name.present?
  }

  scope :by_email, lambda { |email|
    where('email ILIKE ?', "%#{email}%") if email.present?
  }
end

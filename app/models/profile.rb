class Profile < ApplicationRecord
  belongs_to :office
  has_many :selections
  has_one :preference, dependent: :destroy
end

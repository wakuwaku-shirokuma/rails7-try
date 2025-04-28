class Profile < ApplicationRecord
  belongs_to :office
  has_many :selections
end

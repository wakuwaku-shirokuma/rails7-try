# DocumentScreening
class DocumentScreening < ApplicationRecord
  belongs_to :profile
  belongs_to :selection
  has_many :document_screening_phases, as: :phaseable
end

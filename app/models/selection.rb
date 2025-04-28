class Selection < ApplicationRecord
  belongs_to :profile
  has_one :document_screening_phase, as: :phaseable
  has_one :interview_phase, as: :phaseable
  has_one :offer_phase, as: :phaseable
end

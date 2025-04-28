class InterviewPhase < ApplicationRecord
  belongs_to :phaseable, polymorphic: true
end

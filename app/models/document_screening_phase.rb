class DocumentScreeningPhase < ApplicationRecord
  belongs_to :phaseable, polymorphic: true
end

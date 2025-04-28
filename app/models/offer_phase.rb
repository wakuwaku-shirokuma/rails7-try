class OfferPhase < ApplicationRecord
  belongs_to :phaseable, polymorphic: true
end

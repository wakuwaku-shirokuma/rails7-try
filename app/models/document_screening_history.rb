# DocumentScreeningHistory
class DocumentScreeningHistory < ApplicationRecord
  belongs_to :document_screening_phase
  belongs_to :user # どの担当者が選考を行ったか
end

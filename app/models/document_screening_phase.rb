class DocumentScreeningPhase < ApplicationRecord
  belongs_to :phaseable, polymorphic: true
  has_many :document_screenings # 1つの選考全体には、複数の選考履歴が関連する
end

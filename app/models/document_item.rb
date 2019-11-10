class DocumentItem < ApplicationRecord
    belongs_to :document
    has_many :document_selects
end

class Document < ApplicationRecord
    has_many :document_items
    has_many :answers
    belongs_to :user
end

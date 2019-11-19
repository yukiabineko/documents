class Document < ApplicationRecord
    has_many :document_items
    has_many :answers
    belongs_to :user
    validates :title,presence:true
    validates :memo,presence:true
    validates :deadline,presence:true
end

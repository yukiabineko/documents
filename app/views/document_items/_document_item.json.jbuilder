json.extract! document_item, :id, :content, :document_id, :created_at, :updated_at
json.url document_item_url(document_item, format: :json)

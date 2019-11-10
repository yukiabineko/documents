json.extract! document_select, :id, :content, :select_number, :document_item_id, :created_at, :updated_at
json.url document_select_url(document_select, format: :json)

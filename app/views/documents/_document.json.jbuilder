json.extract! document, :id, :title, :memo, :pdf_link, :deadline, :created_at, :updated_at
json.url document_url(document, format: :json)

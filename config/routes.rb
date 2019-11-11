Rails.application.routes.draw do
  root 'documents#index'
  resources :answers
  resources :document_selects
  get "documents_selects/new/:id",to:"document_selects#new"

  get "documents_items/new2/:id",to:"document_items#new2"
  post"document_items/create2",to:"document_items#create2"
  resources :document_items
  get "documents_items/new/:id",to:"document_items#new"

  get "documents/new2",to:"documents#new2",as: :new2_document
  get "documents/new2/:id",to:"documents#new2"
  post "documents/create2",to:"documents#create2",as: :document_create2
  resources :documents
  post "documents/sendform/:id",to:"documents#sendform"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
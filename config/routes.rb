Rails.application.routes.draw do
  root 'documents#index'
  resources :answers
  resources :document_selects
  get "documents_selects/new/:id",to:"document_selects#new"
  resources :document_items
  get "documents_items/new/:id",to:"document_items#new"
  resources :documents
  post "documents/sendform/:id",to:"documents#sendform"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
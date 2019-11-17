Rails.application.routes.draw do
  resources :users do
    member do
      get "file_show/:document_id",to:"users#file_show",as: :file_show
    end    
  end   
  
  root 'documents#index'

  get "documents/pdf-modal/:id",to:"documents#data",as: :data
  resources :answers
  resources :document_selects
  get "documents_selects/new/:id",to:"document_selects#new"

  get "documents_items/new2/:id",to:"document_items#new2"
  post"document_items/create/:document_id",to:"document_items#create",as: :document_item_create #ユーザー全体create
  post"document_selects/create/:document_item_id",to:"document_selects#create",as: :document_select_create #ユーザー全体create

  post"document_items/create2/:document_id",to:"document_items#create2",as: :document_item_create2#ユーザー全体create
  resources :document_items
  get "documents_items/new/:id",to:"document_items#new"
  
  
  get "document/teacher1",to:"documents#teacher1",as: :teacher1
  get "document/teacher2",to:"documents#teacher2",as: :teacher2

  get "documents/new2",to:"documents#new2",as: :new2_document
  get "documents/new2/:id",to:"documents#new2"

  get "documents/new3",to:"documents#new3",as: :new3_document
  get "documents/new3/:id",to:"documents#new3"
  post "documents/create2",to:"documents#create2",as: :document_create2 #ユーザー全体create
  post "documents/create3",to:"documents#create3",as: :document_create3
  resources :documents
  post "documents/selectform/:id",to:"documents#selectform",as: :selectform
  post "documents/inputform/:id",to:"documents#inputform",as: :inputform

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
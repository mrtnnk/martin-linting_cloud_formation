Rails.application.routes.draw do

  get 'take_picture/index', to: 'take_picture#index', as: :take_picture_index
  post 'take_picture/result', to: 'take_picture#result', as: :take_picture_result

  #authentication => login
  get 'login', to: "sessions#new", as: :login
  post 'login', to: "sessions#create"
  get 'logout', to: "sessions#destroy", as: :logout

  #authentication => signup
  #resources :users
  # get 'signup', to: "users#new", as: :signup
  # post 'signup', to: "users#create"


# edit_user GET    /users/:id/edit(.:format)                      users#edit
# user GET    /users/:id(.:format)                           users#show
#     PATCH  /users/:id(.:format)                           users#update
#     PUT    /users/:id(.:format)                           users#update
#     DELETE /users/:id(.:format)                           users#destroy

  get '/users/:id/edit', to: "users#edit", as: :edit_user
  get '/users/:id', to: "users#show", as: :user
  put '/users/:id', to: "users#update"
  patch '/users/:id', to: "users#update"
  delete '/users/:id', to: "users#destroy"

  #onboarding
  get '/onboarding/:id', to: "onboarding#show", as: :onboarding
  put '/onboarding/:id', to: "onboarding#update"
  get '/onboarding', to: "onboarding#index", as: :onboarding_index
  get '/onboarding/go/back', to: "onboarding#go_back", as: :go_back
  get '/onboarding/question/skip', to: "onboarding#skip_to", as: :skip_to

  #dashboard
  get '/filings', to: "dashboard#index", as: :dashboard
  get '/filings/download', to: "dashboard#download", as: :download
  get '/filings/download/pdf', to: "dashboard#download_pdf", as: :download_pdf, :constraints => {:format => /(pdf)/}

  get 'about', to: "home#about", as: :about
  get 'resources', to: "home#resources", as: :resources
  get 'terms_of_use', to: "home#terms_of_use", as: :terms_of_use
  get 'legal_disclaimer', to: "home#legal_disclaimer", as: :legal_disclaimer
  get 'privacy', to: "home#privacy", as: :privacy

  get 'choices', to: "home#choices", as: :choices

  resources :questions
  post '/questions/upload/image/:question_id', to: "questions#image", as: :upload_image
  get '/questions/choose/type', to: "questions#choose_type"
  get '/questions/add/content', to: "questions#add_content", as: :add_content
  get '/questions/add/override', to: "questions#add_override", as: :add_override

  resources :documents
  post '/documents/upload/file/:id', to: "documents#file", as: :upload_file
  get '/documents/restart/:id', to: "documents#restart_user_docs", as: :restart_user_docs
  post '/documents/reactivate/:id', to: "documents#reactivate", as: :reactivate_doc

  get '/google/drive', to: "documents#google_drive", as: :google_drive
  get '/google/auth', to: "documents#google_auth", as: :google_auth

  resources :steps

  root to: "home#index"
end

Rails.application.routes.draw do

  get 'editors/checkvalid', to: 'editors#check_validate', as: 'check_valid'
  resources :editors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'editors#new'
end

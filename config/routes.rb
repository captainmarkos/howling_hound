Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :bank_accounts
    #resources :bank_accounts, only: [:index, :show]
  end

end
